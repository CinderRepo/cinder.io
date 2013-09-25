#Handle client side subscriptions to data from the server
#Publish user data to the client from the server
Meteor.subscribe 'userData'

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
        analytics.emit 'User updated game'
        #analytics.emit game.name + ' updated to version ' + game.version
        if Session.get('activeTile') and Session.equals('appState','play')
          notifyUser(game.version)
  )
)

#We track only on startup to prevent misc. pushes to the analytics of data we don't need, as well as undefined values.
Meteor.startup(()->
  #Track changes to the modalState and push them to analytics
  Deps.autorun(@trackModalStateChanges = ()->
    modalState = Session.get('modalState')
    oldModalState = Session.get('oldModalState')

    if modalState
      if modalState isnt oldModalState
        if oldModalState
          analytics.emit 'User stopped viewing ' + oldModalState + ' modal'
        analytics.emit 'User started viewing ' + modalState + ' modal'
    else
      if oldModalState
        #Triggers if the modal is closed, yet a previous modal has been opened before.
        analytics.emit 'User stopped viewing ' + oldModalState + ' modal'
  )

  #Track changes to the appState and push them to analytics
  Deps.autorun(@trackAppStateChanges = () ->
    appState = Session.get('appState')
    oldAppState = Session.get('oldAppState')

    if appState
      if appState isnt oldAppState
        if oldAppState
          analytics.emit 'User stopped viewing ' + oldAppState + ' page'
        analytics.emit 'User started viewing ' + appState + ' page'
  )
)

notifyUser = (message) ->
  log 'GAME VERSION HAS CHANGED TO ' + message
  Session.set('notificationActive',true)

logRenders = ->
  _.each Template, (template, name) ->
    oldRender = template.rendered
    counter = 0
    template.rendered = ->
      console.log name, "render count: ", ++counter
      oldRender and oldRender.apply(this, arguments_)

#Client Init Code
Meteor.startup(()->
  #Determine OS the user is running
  checkOS()
)
