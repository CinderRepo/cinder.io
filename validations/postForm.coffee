#Specifiy the valid formats for data submitted from the signup form.
Schema.postFormSchema = new SimpleSchema
  content:
    type: String
    label: "Content"
    optional: false
    min: 1

#Customize output messages sent to the user when an error is come across.
Schema.postFormSchema.messages
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
  Session.setDefault("postText","Add post..")
  postForm = new AutoForm(Schema.postFormSchema)

  Template.postForm.helpers
    postFormSchema: ->
      postForm
    onSubmit: ->
      #We call and validate createUser clientside (with serverside checks as well) so that
      #the user will get automatically logged in, as the Accounts package does that by default.
      #log "ONSUBMIT:"
      context = this
      log "context: ",context
      #Session.set "currentPost",context._id
      #log "context 1: ",context
      (insertDoc,updateDoc,currentDoc)->
        #log "RUNNING!"
        check(insertDoc,Schema.postFormSchema)
        #log "PASSED CHECK!"
        #log "creating a comment!"
        #log "insertDoc: ",insertDoc
        #log "updateDoc: ",updateDoc
        #log "currentDoc: ",currentDoc
        self = this
        #log "self: ",self
        contentInfoParam = Router.current().params['contentInfo']
        #log "contentInfoParam: ",contentInfoParam
        #log "context 2: ",context
        currentUser = Meteor.user() if Meteor.user()?
        insertDoc.parent = context._id
        insertDoc.parentSlug = context.titleSlug
        insertDoc.owner = currentUser._id
        log "insertDoc: ",insertDoc
        #log "Updated insertDoc: ",insertDoc
        Posts.insert(
          insertDoc
        ,
          (err,result)->
            if err
              log "err: ",err
            else
              #log "Add the post ID to the current contentInfo"
              Community.update(
                _id: context._id
              ,
                $push:
                  "posts": result
              ,
                (err,result)->
                  if err
                    log "err: ",err
                  else
                    log "result: ",result
                    self.resetForm()
              )
        )
        false

  #XXX: This is a hack to get around inputs being rewritten by Meteor
  Template.postForm.events
    "keyup .formInput":(e,t) ->
      currentTarget = $(e.currentTarget)
      data = t.data
      #log "data._id:",data._id
      Session.set "currentPost",data._id
      Session.set "postText",currentTarget.val()
    #"click .topicForm":(e,t)->
      #Session.set "currentPost",data._id
  Template.postForm.rendered = () ->
    #log "TEMPLATE POST FORM RENDERED MOTHER FUCKING SHIT"
    self = this
    data = self.data._id
    #log "Session currentPost: ",Session.get("currentPost")
    #log "self: ",self
    #log "data: ",data
    formInput = $(this.find(".formInput"))
    #log "formInput: ",formInput
    if Session.equals "currentPost",data
      #log "IT MATCHES!"
      formInput.val(Session.get "postText")