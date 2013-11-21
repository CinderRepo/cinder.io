Meteor.users.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true

Meteor.publish "allUsers", ->
  Meteor.users.find()

<<<<<<< HEAD
#We check the schema again on the server to be sure that we're not
#Having calls bypassed via Accounts.CreateUser() from the client
Schema.newUserSchema = new SimpleSchema
  username:
    type: String
    min: 3
  email:
    type: String
    regEx: SchemaRegEx.Email
    min: 3

Accounts.onCreateUser (options, user) ->
  log "Adding slug to user"
  log "options: ",options
  log "user: ",user
  user.ownerSlug = _.slugify user.username
  user.profile = {}
  user.profile.creations = []
  user.profile.profileSrc = "/users/defaults/profileImage.png"
  user.profile.profileCoverSrc = "/users/defaults/profileCover.png"
  user.profile.description =
    "#{user.username} hasn't updated their default profile information yet, but we can rest assured that they shall surely do so in the near future by merely hovering over this text, clicking to edit it, and than typing whatever their hearts may desire. They just need to click elsewhere on the page and we'll handle the rest. Cheerio!"
  user.profile.stripeCustomerId = undefined
  user.profile.favorites = []
  user.profile.following = []
  user.profile.followers = []
  user.profile.playing = undefined
  user.profile.cinderAppSessions = []
  log "user.ownerSlug: ",user.ownerSlug
  #We still want the default hook's 'profile' behavior.
  if options.profile
    user.profile = options.profile
  user

#Check that doc fits with business logic
Accounts.validateNewUser (doc) ->
  log "validateNewUser called, checking business logic."
  #We input the values into a schema and test it against our
  #signupFormSchema to be sure the values are the same in both areas.
  userObject =
    username: doc.username
    email: doc.emails[0].address
  check(userObject,Schema.newUserSchema)
  log "Returning true?"
  true
=======
#Validate user creation and to the user object
###Accounts.validateNewUser (user) ->
  log "validateNewUser called."
  log "user:",user

  if user.anonymous and !user.username and !user.emails and !user.password
    #log 'User is anonymous, and no username/emails/passwords have been passed in. Create an empty anonymous user.'
    true
  else
    #Only fire if all arguments are properly passed in and user is not anonymous.
    log "CHECKING THIS SHIT!"
    rawFormData = [
      name: "username"
      value: user.username
    ,
      name: "email"
      value: user.emails[0].address
    ,
      name: "password"
      value: user.services.password
    ]

    validationObject = Mesosphere.signupForm.validate(rawFormData)
    #If errors exist, generate the proper notifications to send back to the client.
    if validationObject.errors
      _.each validationObject.formData, (value,key) ->
        if validationObject.errors[key]
          #Send a notification and return false if there's an error
          sendNotification
            field: key
            message: validationObject.errors[key].message
          false
        else
          #Clear a notification if there's no error for that field,
          #this is to clear errors that may exist already but have since
          #been corrected by validation.
          clearNotification
            field: key
            message: value.message
    else
      #No errors exist, we can return true and create the user.
      true###
>>>>>>> master
