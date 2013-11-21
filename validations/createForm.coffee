#Specifiy the valid formats for data submitted from the signup form.
Schema.createFormSchema = new SimpleSchema
  title:
    type: String
    label: "Title"
    optional: false
    min: 3
  #type:
  #  type: String
  #  label: "Type"
  #  optional: false

#Customize output messages sent to the user when an error is come across.
Schema.createFormSchema.messages
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
  createForm = new AutoForm(Schema.createFormSchema)

  ###Template.createForm.events
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

  Template.createForm.helpers
    createFormSchema: ->
      createForm
    onSubmit: ->
      #log "Submit called?"
      #We call and validate createUser clientside (with serverside checks as well) so that
      #the user will get automatically logged in, as the Accounts package does that by default.
      (insertDoc,updateDoc,currentDoc)->
        #log "Submit called!"
        check(insertDoc,Schema.createFormSchema)
        #log "creating a project!"
        #log "insertDoc: ",insertDoc
        self = this
        currentUser = Meteor.user() if Meteor.user()?
        insertDoc.owner = currentUser._id
        insertDoc.ownerSlug = _.slugify currentUser.username
        insertDoc.titleSlug = _.slugify insertDoc.title
        insertDoc.collaborators = []
        insertDoc.collaborators.push currentUser._id
        insertDoc.description =
          "#{currentUser.username} is just getting started with their game idea, and hasn't made a description yet."
        insertDoc.previewSrc = "/users/defaults/preview.png"
        insertDoc.coverSrc = "/users/defaults/cover.png"
        #Hard coded type, we could add more media types in the future
        insertDoc.type = "game"
        #log "Updated insertDoc: ",insertDoc
        Content.insert(
          insertDoc
        ,
          (err,result)->
            if err
              log "err: ",err
            else
              #Add the document ID to the current user
              #log "result: ",result
              resultId = result
              log "resultId:",resultId
              createdContent = Content.findOne(resultId)
              log "createdContent: ",createdContent
              #Create a folder on the user's computer
              Meteor.call("createFolder",currentUser.username,createdContent.title,createdContent._id)
              #Add the userId to the User's creations collection
              Meteor.users.update(
                _id: currentUser._id
              ,
                $addToSet:
                  "profile.creations": result
              ,
                (err,result)->
                  if err
                    log "err: ",err
                  else
                    log "result: ",result
                    #log "resultId: ",resultId
                    #Toggle the cover, reset the form, and redirect the user to the newly created project upon completion
                    toggleCover()
                    #self.resetForm()
                    Router.go("/users/#{insertDoc.owner}/#{resultId}/community")
              )
            #log "Content.namedContext('default').invalidKeys()",Content.namedContext("default").invalidKeys()
        )
        false