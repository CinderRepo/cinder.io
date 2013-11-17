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
Handlebars.registerHelper "userCanEdit", (user, owner) ->
  userCanEdit = false
  #log "USER:",user
  #log "OWNER:",owner
  #log "THIS:",this
  ###self = this
  if self._id and Meteor.user()
    #Check if the current user has edit access to the content
    userContentIds = Meteor.user().profile.content
    currentContentId = self._id
    #log self._id
    #Loop through the user's owned content to see if
    #they have access to the current content being viewed
    _.each userContentIds, (userContentId) ->
      if currentContentId is userContentId
        #log "match!!!"
        userCanEdit = true
  #log "Returning this shit!",userCanEdit
  userCanEdit###