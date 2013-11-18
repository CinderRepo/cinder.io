#Specifiy the valid formats for data submitted from the signup form.
Schema.pledgeFormSchema = new SimpleSchema
  pledge:
    type: Number
    label: "Pledge"
    optional: false
    min: 1

#Customize output messages sent to the user when an error is come across.
Schema.pledgeFormSchema.messages
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
  pledgeForm = new AutoForm(Schema.pledgeFormSchema)
  Template.pledgeForm.helpers
    pledgeFormSchema: ->
      pledgeForm
    onSubmit: ->
      self = this
      (insertDoc,updateDoc,currentDoc)->
        log "pledgeForm submit called!"
        check(insertDoc,Schema.pledgeFormSchema)
        log "self: ",self
        user = Meteor.user()
        log "insertDoc: ",insertDoc
        if user.profile.cards.length is 0
          log "User has no credit cards!"
          Session.set "topicOpen",self._id
          Session.set "topicTrayOpen",self._id
        else
          log "User has credit cards! Process payment"
        false