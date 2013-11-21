#Specifiy the valid formats for data submitted from the signup form.
Schema.pledgeFormSchema = new SimpleSchema
  pledge:
    type: String
    label: "Pledge"
    optional: false
    min: 1
    max: 7

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
    pledgeAmount: ->
      Session.get "pledgeAmount"
    onSubmit: ->
      self = this
      #log "PLEDGE FORM!"
      #log "self: ",self
      topicId = self._id
      (insertDoc,updateDoc,currentDoc)->
        log "pledgeForm submit called!"
        check(insertDoc,Schema.pledgeFormSchema)
        log "self: ",self
        user = Meteor.user()
        log "insertDoc: ",insertDoc
        stripeCustomerId = user.profile.stripeCustomerId

        #Convert pledgeDollars to cents for Stripe input
        pledge = dollarToCent(insertDoc.pledge)
        log "pledge: ",pledge

        if stripeCustomerId is null
          log "User has no stripeCustomerId!"
          Session.set "topicOpen",self._id
          Session.set "topicTrayOpen",self._id
        else
          log "User has credit cards! Process payment"
          Meteor.call "createCharge", topicId,pledge,stripeCustomerId,false,
            (err,result) ->
              if err
                log "err: ",err
              else
                log "result: ",result
                log "CREATE CHARGE FINISHED FROM PLEDGE FORM"
        false

  Template.pledgeForm.events
    "keyup [data-format='money']":(e,t)->
      log "I'M TYPING IN MONEY BABY"
      currentTarget = $(e.currentTarget)
      data = t.data
      log "data: ",data

      #XXX: Sadly, some DOM manipulation has to happen here in
      #order to get the flow we want. Perhaps in the new Meteor UI
      #release there will be a better/easier to manage way to access
      #certain instances of templates.
      topicTrayMoneyInput = currentTarget.parents(".topic").find(".topicTray [data-format='money']")

      #Get the values and update them
      pledgeFormValue = currentTarget.val()
      topicTrayValue = topicTrayMoneyInput.val()

      log "pledgeFormValue: ",pledgeFormValue
      log "topicTrayValue: ",topicTrayValue

      #Set the topicTrayValue to be that of the pledgeFormValue
      topicTrayMoneyInput.val(pledgeFormValue)