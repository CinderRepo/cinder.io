#Tile Dimensions
@tilesPerspective = 100
@tileWidth = 400
@tileHeight = 300
@expandedTileHeight = null

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

Meteor.startup(()->
  Session.setDefault('appState','welcome')
  #Determine OS the user is running
  checkOS()
  #Calculate windowWidth for grid dimensions
  getWindowSize()
  #initialize physics
  #initPhysics()
  #Start client request animation frame heartbeat
  #heartbeat()
  #debugger
)

logRenders = ->
  _.each Template, (template, name) ->
    oldRender = template.rendered
    counter = 0
    template.rendered = ->
      console.log name, "render count: ", ++counter
      oldRender and oldRender.apply(this, arguments_)

#Notify User of an Updated Game
Meteor.subscribe('games',()->
  Deps.autorun(@checkGameVersion = () ->
    if Session.get('activeTile')
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
  Session.set('activeNotification',true)

renderParticles = () ->
  #log 'renderingParticles'
  for particle, i in particles
    matrix3d = "matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, " + physics.particles[i].pos.x + ", " + physics.particles[i].pos.y + ", " + 0 + ", 1)"
    particle.style.webkitTransform = matrix3d

heartbeat = (timestamp) ->
  if Session.equals('physicsInitialized',true)
    renderParticles()
  #Step Physics
  physics.step()
  requestAnimationFrame heartbeat