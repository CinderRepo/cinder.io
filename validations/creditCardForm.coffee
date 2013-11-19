#Specifiy the valid formats for data submitted from the signup form.
Schema.creditCardFormSchema = new SimpleSchema
  pledge:
    type: String
    label: "Pledge"
    optional: false
    min: 1
    max: 7
  number:
    type: String
    label: "Number"
    optional: false
    max: 20
  expiry:
    type: String
    label: "Expiry"
    optional: false
    min: 2
    max: 9
  cvc:
    type: String
    label: "CVC"
    optional: false
    min: 3
    max: 4
  remember:
    type: String
    optional: true

#Customize output messages sent to the user when an error is come across.
Schema.creditCardFormSchema.messages
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
  creditCardForm = new AutoForm(Schema.creditCardFormSchema)
  Template.creditCardForm.helpers
    creditCardFormSchema: ->
      creditCardForm
    pledgeAmount: ->
      Session.get "pledgeAmount"
    onSubmit: ->
      self = this
      #log "creditCardForm!"
      #log "self: ",self
      topicId = self._id
      #We call and validate createUser clientside (with serverside checks as well) so that
      #the user will get automatically logged in, as the Accounts package does that by default.
      (insertDoc,updateDoc,currentDoc)->
        log "this: ",this
        check(insertDoc,Schema.creditCardFormSchema)
        log "insertDoc: ",insertDoc
        #Now that the initial Schema validation has been passed,
        #check against Stripe's validation library as well.
        numberValid = $.payment.validateCardNumber(insertDoc.number)
        #Parse the expiry values into a month and year
        expiry = $.payment.cardExpiryVal(insertDoc.expiry)
        log "expiry: ",expiry
        expiryValid = $.payment.validateCardExpiry(expiry)
        cvcValid = $.payment.validateCardCVC(insertDoc.cvc)
        log "numberValid: ",numberValid
        log "expiryValid: ",expiryValid
        log "cvcValid: ",cvcValid

        #If all the values pause the Stripe validation, prepare to make a single use token.
        if numberValid and expiryValid and cvcValid
          log "Creating Stripe token!"
          log "number: ",insertDoc.number
          log "exp_month: ",expiry.month
          log "exp_year: ",expiry.year
          log "cvc: ",insertDoc.cvc

          Stripe.card.createToken
            number: insertDoc.number
            exp_month: expiry.month
            exp_year: expiry.year
            cvc: insertDoc.cvc
          , (status,response)->
            log "STUFF IS HAPPENING!"
            if response.error
              #Errors were returned from Stripe
              log "Errors returned from Stripe."
              log "response.error.message: ",response.error.message
            else
              #Everything went smoothly and we have a token
              token = response["id"]
              log "token: ",token

              #Convert pledgeDollars to cents for Stripe input
              pledge = dollarToCent(insertDoc.pledge)
              log "pledge: ",pledge

              remember = insertDoc.remember
              log "remember: ",remember

              Meteor.call "createCharge", topicId,pledge,token,remember,
                (err,result) ->
                  if err
                    log "err: ",err
                  else
                    log "CREATE CHARGE FINISHED FROM CREDIT CARD FORM"
                    log "result: ",result
                    #Close the tray
                    Session.set "topicOpen",undefined
                    Session.set "topicTrayOpen",undefined
        else
          #XXX: Output errors to the user here in the future
          log "Output errors to the user here in the future"
        false

  Template.creditCardForm.rendered = () ->
    #log "creditCardForm rendered!"
    topicTrayForm = $(".topicTrayForm")
    card = topicTrayForm.find(".formInput[data-format='card']")
    expiry = topicTrayForm.find(".formInput[data-format='expiry']")
    cvc = topicTrayForm.find(".formInput[data-format='cvc']")

    #log "card: ",card
    #log "expiry: ",expiry
    #log "cvc: ",cvc

    #Set payment formats
    card.payment("formatCardNumber")
    expiry.payment("formatCardExpiry")
    cvc.payment("formatCardCVC")

  Template.creditCardForm.events
    "click [data-action='toggleRemember']": (e,t) ->
      log ".toggle Clicked"

      currentTarget = $(e.currentTarget).parents(".toggle")
      log "currentTarget: ",currentTarget

      rememberInput = t.find(".formInput[name='remember']")
      log "rememberInput: ",rememberInput

      if currentTarget.attr("data-on") is "true"
        currentTarget.attr("data-on","false")
        rememberInput.value = false
      else
        currentTarget.attr("data-on","true")
        rememberInput.value = true