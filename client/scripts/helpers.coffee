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
Handlebars.registerHelper "coverIs", (context) ->
  Session.equals("cover",context)
Handlebars.registerHelper "isEmpty", (context) ->
  context.count() is 0 if context?
Handlebars.registerHelper "isNotEmpty", (context) ->
  context.count() isnt 0 if context?
Handlebars.registerHelper "userCanEdit", (context) ->
  userCanEdit = false
  self = this
  collaborators = self.content.collaborators
  userId = Meteor.userId()
  _.each collaborators, (collaboratorId) ->
    if collaboratorId is userId
      userCanEdit = true
  userCanEdit
Handlebars.registerHelper "isNotOwner", (context) ->
  self = this
  userId = Meteor.userId()
  #log "self._id: ",self._id
  #log "userId: ",userId
  userId isnt self._id
Handlebars.registerHelper "isOwner", (context) ->
  self = this
  userId = Meteor.userId()
  #log "self: ",self.owner
  #log "userId: ",userId
  userId is self._id