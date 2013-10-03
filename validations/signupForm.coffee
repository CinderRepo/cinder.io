#Specifiy the valid formats for data submitted from the signup form.
Schema.signupFormSchema = new SimpleSchema
  username:
    type: String
    label: "Username"
    optional: false
    min: 3
  email:
    type: String
    regEx: SchemaRegEx.Email
    label: "Email"
    optional: false
  password:
    type: String
    label: "Password"
    optional: false

#Customize output messages sent to the user when an error is come across.
Schema.signupFormSchema.messages
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
  signupForm = new AutoForm(Schema.signupFormSchema)
  Template.signupForm.helpers
    signupFormSchema: ->
      signupForm
    onSubmit: ->
      #We call and validate createUser clientside (with serverside checks as well) so that
      #the user will get automatically logged in, as the Accounts package does that by default.
      (insertDoc,updateDoc,currentDoc)->
        check(insertDoc,Schema.signupFormSchema)
        Accounts.createUser(insertDoc)
        false