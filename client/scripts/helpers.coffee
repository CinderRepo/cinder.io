Handlebars.registerHelper "icon", (context) ->
  #Only output if the template actually exists
  if typeof(Template[context + "Icon"]) is "function"
    new Handlebars.SafeString(Template[context + "Icon"]())
Handlebars.registerHelper "toHtml", (context) ->
  #log context
  new Handlebars.SafeString(context) if context?
Handlebars.registerHelper "usersCount", (context) ->
  _.numberFormat(Meteor.users.find().count())
Handlebars.registerHelper "typeIs", (context) ->
  this.type == context
Handlebars.registerHelper "player", (context) ->
  #log context
  new Handlebars.SafeString(Template["player"]())
Handlebars.registerHelper "toSlug", (context) ->
  _.slugify context
Handlebars.registerHelper "currentParamIs", (param,a,b) ->
  currentParam = Router.current().params[param]
  currentParam is a or currentParam is b
Handlebars.registerHelper "currentParamIsNot", (param,a,b) ->
  currentParam = Router.current().params[param]
  currentParam isnt a and currentParam isnt b
Handlebars.registerHelper "currentParam", (context) ->
  Router.current().params[context]
Handlebars.registerHelper "currentTemplateIs", (context) ->
  Router.current().template is context
Handlebars.registerHelper "currentTemplateIsNot", (context) ->
  Router.current().template isnt context
Handlebars.registerHelper "coverIs", (context) ->
  Session.equals("cover",context)
Handlebars.registerHelper "isEmpty", (context) ->
  context.count() is 0 if context?
Handlebars.registerHelper "isNotEmpty", (context) ->
  context.count() isnt 0 if context?
Handlebars.registerHelper "userCanEdit", (context) ->
  userCanEdit = false
  self = this
  currentRoute = Router.current()

  userId = Meteor.userId()

  if currentRoute.params["context"] is "profile"
    ownerId = currentRoute.params["owner"]
    owner = Meteor.users.findOne(ownerId)
    log "user!",owner
    if userId is owner._id
      userCanEdit = true
  else
    contentId = currentRoute.params["context"]
    content = Content.findOne(contentId)
    log "game content!",contentId

    collaborators = content.collaborators
    log "collaborators: ",collaborators

    _.each collaborators, (collaboratorId) ->
      if collaboratorId is userId
        userCanEdit = true
  userCanEdit
Handlebars.registerHelper "userIsNotOwner", (context) ->
  self = this
  userId = Meteor.userId()
  #log "self._id: ",self._id
  #log "userId: ",userId
  userId isnt self._id
Handlebars.registerHelper "userIsOwner", (context) ->
  self = this
  userId = Meteor.userId()
  #log "userIsOwner.."
  #log "self: ",self
  #log "userId: ",userId
  userId is self._id
Handlebars.registerHelper "arrayIsEmpty", (context) ->
  context.length is 0
Handlebars.registerHelper "arrayIsNotEmpty", (context) ->
  context.length isnt 0
Handlebars.registerHelper "arrayIsGreaterThan", (context,a) ->
  context.length > a
Handlebars.registerHelper "arrayIsLessThan", (context,a) ->
  context.length < a
Handlebars.registerHelper "userProfileArrayHas", (context,value) ->
  userProfileArray = Meteor.user().profile[context] if Meteor.user()?
  valueExists = _.contains userProfileArray, value
Handlebars.registerHelper "getUserById", (context) ->
  Meteor.users.findOne _id: context
Handlebars.registerHelper "cinderAppConnected", (context) ->
  #XXX: Fix this after launch party
  if Meteor.user()
    if Meteor.user().profile
      if Meteor.user().profile.cinderAppSessions
        if Meteor.user().profile.cinderAppSessions.length > 0
          log "true!"
          true
        else
          false
Handlebars.registerHelper "uuid", (context) ->
  Meteor.uuid()
Handlebars.registerHelper "randomGame", (context) ->
  Content.findOne()
Handlebars.registerHelper "nl2br", (text) ->
  nl2br = (text + "").replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, "$1" + "<br>" + "$2")
  new Handlebars.SafeString(nl2br)