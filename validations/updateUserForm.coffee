#Specifiy the valid formats for data submitted from the signup form.
Schema.updateUserFormSchema = new SimpleSchema
  "profile.description":
    type: String
    label: "Description"
    optional: false
    min: 3
    max: 400

#Customize output messages sent to the user when an error is come across.
Schema.updateUserFormSchema.messages
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
  updateUserForm = new AutoForm(Schema.updateUserFormSchema)

  ###Template.updateUserForm.events
    "change [name='type']":(e,t)->
      log "Changing"
      currentTarget = e.currentTarget
      projectType = $("[data-schema-key='type']")

      #Set the value of projectType to be that of the radio element.
      projectType.val(currentTarget.value)
    "reset form":(e,t)->
      #Reset the projectType value back to game when the form is reset
      projectType = $("[data-schema-key='type']")
      projectType.val("game")###

  Template.updateUserForm.helpers
    updateUserFormSchema: ->
      updateUserForm
    onSubmit: ->
      #We call and validate createUser clientside (with serverside checks as well) so that
      #the user will get automatically logged in, as the Accounts package does that by default.
      #log "ONSUBMIT:"
      self = this
      context = Router.current().params["context"]
      log "context: ",context
      (insertDoc,updateDoc,currentDoc)->
        check(insertDoc,Schema.updateUserFormSchema)
        #log "creating an about!"
        #log "insertDoc: ",insertDoc
        #log "updateDoc: ",updateDoc
        #log "currentDoc: ",currentDoc
        log "self: ",self
        #If we're dealing with a user, update their content
        log "Updating content!"
        Meteor.users.update
          _id: self._id
        ,
          updateDoc
        ,
          (err,result) ->
            if err
              log "err: ",err
            else
              log "result: ",result
        false

  Template.updateUserForm.events
    "blur .formInput":(e,t)->
      formSubmit = t.find(".formSubmit")
      $(formSubmit).click()