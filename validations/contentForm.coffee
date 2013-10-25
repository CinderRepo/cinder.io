#Specifiy the valid formats for data submitted from the signup form.
Schema.contentFormSchema = new SimpleSchema
  content:
    type: String
    label: "Content"
    optional: false
    min: 3

#Customize output messages sent to the user when an error is come across.
Schema.contentFormSchema.messages
  required: "[label] is required!"
  minString: "[label] must be at least [min] characters!"
  maxString: "[label] cannot exceed [max] characters!"
  minNumber: "[label] must be at least [min]!"
  maxNumber: "[label] cannot exceed [max]!"
  minDate: "[label] must be on or before [min]!"
  maxDate: "[label] cannot be after [max]!"
  minCount: "You must specify at least [minCount] values!"
  maxCount: "You cannot specify more than [maxCount] values!"
  noDecimal: "[label] must be an integer!"
  notAllowed: "[value] is not an allowed value!"
  expectedString: "[label] must be a string!"
  expectedNumber: "[label] must be a number!"
  expectedBoolean: "[label] must be a boolean!"
  expectedArray: "[label] must be an array!"
  expectedObject: "[label] must be an object!"
  expectedConstructor: "[label] must be a [type]!"
  regEx: "Whoa there buddy! Your [label] doesn't look right!"

#Create a new AutoForm instance that adheres to the schema provided, and create a template helper for it.
if Meteor.isClient
  contentForm = new AutoForm(Schema.contentFormSchema)

  Template.contentForm.events
    "change [name='type']":(e,t)->
      currentTarget = e.currentTarget
      projectType = $("[data-schema-key='type']")

      #Set the value of projectType to be that of the radio element.
      projectType.val(currentTarget.value)
    "reset form":(e,t)->
      #Reset the projectType value back to game when the form is reset
      projectType = $("[data-schema-key='type']")
      projectType.val("game")

  Template.contentForm.helpers
    contentFormSchema: ->
      contentForm
    onSubmit: ->
      #We call and validate createUser clientside (with serverside checks as well) so that
      #the user will get automatically logged in, as the Accounts package does that by default.
      #log "ONSUBMIT:"
      context = this
      #log "context: ",context
      (insertDoc,updateDoc,currentDoc)->
        check(insertDoc,Schema.contentFormSchema)
        log "creating an about!"
        #log "insertDoc: ",insertDoc
        #log "updateDoc: ",updateDoc
        #log "currentDoc: ",currentDoc
        self = this
        #log "self: ",self
        contentInfoParam = Router.current().params['contentInfo']
        #log "contentInfoParam: ",contentInfoParam
        currentUser = Meteor.user() if Meteor.user()?
        insertDoc.parent = context._id
        insertDoc.parentSlug = context.titleSlug
        insertDoc.owner = currentUser.username
        log "Updated insertDoc: ",insertDoc
        log "contentInfoParam: ",_.capitalize contentInfoParam
        window[_.capitalize contentInfoParam].insert(
          insertDoc
        ,
          (err,result)->
            if err
              log "err: ",err
            else
              #Add the topic ID to the current content
              modifier = $push: {}
              modifier.$push[contentInfoParam] = result

              Content.update(
                _id: parent._id
              ,
                modifier
              ,
                (err,result)->
                  if err
                    log "err: ",err
                  else
                    log "result: ",result
                    self.resetForm()
              )
            #log "Content.namedContext('default').invalidKeys()",Content.namedContext("default").invalidKeys()
        ) if contentInfoParam?
        false