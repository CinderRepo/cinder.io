#Specifiy the valid formats for data submitted from the signup form.
Schema.paymentFormSchema = new SimpleSchema
  pledge:
    type: Number
    label: "Pledge"

#Customize output messages sent to the user when an error is come across.
Schema.paymentFormSchema.messages
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
  paymentForm = new AutoForm(Schema.paymentFormSchema)
  log "paymentForm: ",paymentForm

  Template.paymentForm.helpers
    paymentFormSchema: ->
      paymentForm
    onSubmit: ->
      log "onSubmit paymentForm!"
      #We call and validate createUser clientside (with serverside checks as well) so that
      #the user will get automatically logged in, as the Accounts package does that by default.
      (insertDoc,updateDoc,currentDoc)->
        log "onSubmit called!"
        check(insertDoc,Schema.paymentFormSchema)
        #log "creating a topic!"
        ###log "insertDoc: ",insertDoc
        log "updateDoc: ",updateDoc
        self = this
        contentInfoParam = Router.current().params['contentInfo']
        currentUser = Meteor.user() if Meteor.user()?
        titleSlug = Router.current().params['titleSlug']
        parent = Content.findOne(titleSlug: titleSlug) if titleSlug?
        #log "parent: ",parent
        #insertDoc.parent = parent._id
        #insertDoc.parentSlug = parent.titleSlug
        #insertDoc.owner = currentUser.username
        #insertDoc.titleSlug = _.slugify insertDoc.title
        #insertDoc.posts = []
        log "Updated insertDoc: ",insertDoc
        window[_.capitalize contentInfoParam].insert(
          insertDoc
        )###
        false