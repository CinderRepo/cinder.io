#Handle client side subscriptions to data from the server
#Notify User of an Updated Game
Meteor.subscribe('games',()->
  Deps.autorun(@checkGameVersion = () ->
    if Session.get('activeTile') and Session.get('activeTile') is not 'create'
      game = Games.findOne({_id:Session.get('activeTile')},{})
      if Session.get('currentGameVersion') != game.version
      #if !Session.equals('currentGameVersion',game.version)
        #The game's version has updated
        log 'game\'s version has been updated!'
        log game.version
        Session.set('currentGameVersion',game.version)
        if Session.get('activeTile') and Session.equals('appState','play')
          notifyUser(game.version)
  )
)

#Publish user data to the client from the server
Meteor.subscribe 'userData'

checkOS = () ->
  Session.setDefault('currentOS','Unknown OS')
  if navigator.appVersion.indexOf('Win') isnt -1
    Session.set('currentOS','windows')
  if navigator.appVersion.indexOf('Mac') isnt -1
    Session.set('currentOS','macos')
  if navigator.appVersion.indexOf('X11') isnt -1
    Session.set('currentOS','unix')
  if navigator.appVersion.indexOf('Linux') isnt -1
    Session.set('currentOS','linux')

logRenders = ->
  _.each Template, (template, name) ->
    oldRender = template.rendered
    counter = 0
    template.rendered = ->
      console.log name, "render count: ", ++counter
      oldRender and oldRender.apply(this, arguments_)

#Prevent Scrolling when appState is view - THIS IS A HACK because Meteor doesn't allow for attributes on the body, which is so fucking dumb that I dont even want to begin to get into it. Ugh.
Deps.autorun(toggleScrolling = ()->
  #Disable scrolling when the webkitTransition is completed
  if Session.equals('disableScrolling',true)
    $('html,body').addClass('scrollingDisabled')
  else
    $('html,body').removeClass('scrollingDisabled')
)

notifyUser = (message) ->
  log 'GAME VERSION HAS CHANGED TO ' + message
  Session.set('notificationActive',true)

Meteor.startup(()->
  #Determine OS the user is running
  checkOS()
)