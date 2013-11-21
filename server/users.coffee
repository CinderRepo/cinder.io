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

Accounts.validateNewUser (doc) ->
  log "Checking to see that gitolite isn't chosen as a username"
  log "doc: ",doc
  if doc.username.toLowerCase() is "gitolite"
    false
  else
    true