#Specifiy the valid formats for data submitted from the signup form.
Schema.topicFormSchema = new SimpleSchema
  title:
    type: String
    label: "Title"
    min: 3
  content:
    type: String
    label: "Content"

#Customize output messages sent to the user when an error is come across.
Schema.topicFormSchema.messages
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
  topicForm = new AutoForm(Schema.topicFormSchema)
  log "topicForm: ",topicForm

  Template.topicForm.helpers
    topicFormSchema: ->
      topicForm
    onSubmit: ->
      log "onSubmit topicForm!"
      #We call and validate createUser clientside (with serverside checks as well) so that
      #the user will get automatically logged in, as the Accounts package does that by default.
      (insertDoc,updateDoc,currentDoc)->
        log "onSubmit called!"
        check(insertDoc,Schema.topicFormSchema)
        #log "creating a topic!"
        #log "insertDoc: ",insertDoc
        self = this
        #log "self: ",self
        contentInfoParam = Router.current().params['contentInfo']
        currentUser = Meteor.user() if Meteor.user()?
        titleSlug = Router.current().params['titleSlug']
        parent = Content.findOne(titleSlug: titleSlug) if titleSlug?
        #log "parent: ",parent
        insertDoc.parent = parent._id
        insertDoc.parentSlug = parent.titleSlug
        insertDoc.owner = currentUser.username
        insertDoc.titleSlug = _.slugify insertDoc.title
        insertDoc.posts = []
        log "Updated insertDoc: ",insertDoc
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
        ###Content.insert(
          insertDoc
        ,
          (err,result)->
            if err
              log "err: ",err
            else
              #Add the document ID to the current user
              log "result: ",result
              Meteor.users.update(
                _id: currentUser._id
              ,
                $push:
                  "profile.content": result
              ,
                (err,result)->
                  if err
                    log "err: ",err
                  else
                    log "result: ",result
              )
              #Toggle the cover, reset the form, and redirect the user to the newly created project upon completion
              toggleCover()
              self.resetForm()
              Router.go("/users/#{insertDoc.ownerSlug}/#{insertDoc.titleSlug}/about")
            log "Content.namedContext('default').invalidKeys()",Content.namedContext("default").invalidKeys()
        )###
        false