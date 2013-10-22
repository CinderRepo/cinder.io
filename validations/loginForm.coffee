#Specifiy the valid formats for data submitted from the signup form.
Schema.loginFormSchema = new SimpleSchema
  usernameOrEmail:
    type: String
    optional: false
  password:
    type: String
    optional: false

#Customize output messages sent to the user when an error is come across.
Schema.loginFormSchema.messages
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
  loginForm = new AutoForm(Schema.loginFormSchema)
  Template.loginForm.helpers
    loginFormSchema: ->
      loginForm
    onSubmit: ->
      #We call and validate createUser clientside (with serverside checks as well) so that
      #the user will get automatically logged in, as the Accounts package does that by default.
      log "Logging in user"
      (insertDoc,updateDoc,currentDoc)->
        log "insertDoc,",insertDoc
        check(insertDoc,Schema.loginFormSchema)
        Meteor.loginWithPassword(
          insertDoc.usernameOrEmail
          insertDoc.password
        ,
          (err)->
            if err
              log "err: ",err
            else
              log "Successfully logged in!"
              toggleCover()
        )
        false