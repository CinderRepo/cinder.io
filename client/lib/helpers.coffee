#Handlebars.registerHelper "userCanEdit", (user, owner) ->
  #log 'userIsOwner handlebars helper called'
  #log "user: ",user.hash
  #log "owner: ",owner
  #log "this: ",this
  #if Session.get('currentContent')
    #Check if the current user has edit access to the content
    #user = Meteor.user().find(content: Session.get('currentContent'))
    #If there's a result, return true, otherwise, return false.
    #unless user
    #  false