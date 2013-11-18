Meteor.users.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true

Meteor.publish "allUsers", ->
  Meteor.users.find()

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
  user.profile.content = []
  user.profile.profileImageSrc = "/users/defaults/profileImage.png"
  user.profile.description = "Edit your user description."
  user.profile.cards = []
  user.profile.favorites = []
  user.profile.following = []
  user.profile.followers = []
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

#Check that a user with that username doesn't exist already
Accounts.validateNewUser (doc) ->
  log "validateNewUser called, checking to see if username already exists."
  unless Meteor.users.findOne("username": doc.username)
    true

#Check that a user with that email doesn't exist already
Accounts.validateNewUser (doc) ->
  log "validateNewUser called, checking to see if email already exists."
  log "doc:",doc
  unless Meteor.users.findOne("addresses.0.email": doc.emails[0].address)
    true