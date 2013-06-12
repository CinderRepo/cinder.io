#Tile Dimensions
@tilesPerspective = 100
@tileWidth = 400
@tileHeight = 300
@expandedTileHeight = null

Meteor.startup(()->
  Session.setDefault('appState','browse')
  #Calculate windowWidth for grid dimensions
  #getWindowSize()
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

#@initGrid = () ->
  #log 'initGrid'
  #unless tileWrappers.length
  #We set a global so that we can access the tileWrappers in other functions, as well as the perspective and ideal tile width.
  #@tilesContainer = $('#tiles')[0]
  #@tileWrappers = $('.tileWrapper')
  #@messages = $('#messages')[0]
  #@container = $('#container')[0]

calculateGrid = () ->
  columnCount = Session.get('columnCount')
  columnWidth = Session.get('columnWidth')
  @tilesContainer = $('#tiles')[0]
  @tileWrappers = $('.tileWrapper')
  @messages = $('#messages')[0]
  @container = $('#container')[0]

  #If there's no tileWrappers in the physics world, add it to the world.
  #if physics.particles.length is 0
    #log 'Adding elements to physics world'
    #tileWrappers.each((i)->
    #  particle = new Particle()
    #  physics.particles.push particle
    #)
  #else
    #Handle Tile Physics
    #tileWrappers.each((i)->
      #Calculate the final webkitTransform
      #matrix3d = "matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, " + physics.particles[i].pos.x + ", " + physics.particles[i].pos.y + ", " + physics.particles[i].pos.z + ", 1)"
      #this.style.webkitTransform = matrix3d
    #)

  #Resize the columns when columnCount changes
  ###switch columnCount
    when 1
      for particle, i in physics.particles
        if particle.element is '.tileWrapper'
          particle.pos.z = translateZValue
    when 2
      for particle, i in physics.particles
        if particle.element is '.tileWrapper'
          particle.pos.z = translateZValue
    when 3
      for particle, i in physics.particles
        if particle.element is '.tileWrapper'
          particle.pos.z = translateZValue
    when 4
      for particle, i in physics.particles
        if particle.element is '.tileWrapper'
          particle.pos.z = translateZValue
    when 5
      for particle, i in physics.particles
        if particle.element is '.tileWrapper'
          particle.pos.z = translateZValue
    when 6
      for particle, i in physics.particles
        if particle.element is '.tileWrapper'
          particle.pos.z = translateZValue
    when 7
      for particle, i in physics.particles
        if particle.element is '.tileWrapper'
          particle.pos.z = translateZValue
    when 8
      for particle, i in physics.particles
        if particle.element is '.tileWrapper'
          particle.pos.z = translateZValue
    when 9
      for particle, i in physics.particles
        if particle.element is '.tileWrapper'
          particle.pos.z = translateZValue
    when 10
      for particle, i in physics.particles
        if particle.element is '.tileWrapper'
          particle.pos.z = translateZValue
    else
      log 'Column Layout Error'###

  #We have to have the wrapper element have the opposite translation, so that people can still click on elements contained within it.
  #translateZValue = -(((tileWidth*tilesPerspective)/columnWidth)-tilesPerspective)
  #inverseMatrix3d = "matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, " + 0 + ", " + 0 + ", " + -translateZValue + ", 1)"
  #tilesContainer.style.webkitTransform = inverseMatrix3d

  #Handle Message Spring RestLengths
  #if Session.equals('appState','view') or
  #    Session.equals('appState','play')
  #  messagesRestLength = 0
  #else
  #  messagesRestLength = 600

  #Handle Container Spring RestLengths
  #if Session.equals('modalState','login')
  #  containerRestLength = 225
  #else if Session.equals('modalState','profile')
  #  containerRestLength = 225
  #else
  #  containerRestLength = 0

  #TODO: Fix this and integrate with physics ASAP
  ###if Session.equals('appState','play')
    $('.tilesBackground').css('display','none')
    $('#masthead').css('display','none')
    $('#messages').css('display','none')
  else
    $('.tilesBackground').css('display','block')
    $('#masthead').css('display','block')
    $('#messages').css('display','block')###

  #Handle World Element Physics - Springs
  #for spring, i in physics.springs
  #  if spring.element is '#container'
  #    spring.restLength = containerRestLength
  #  if spring.element is '#messages'
  #    spring.restLength = messagesRestLength

  #Handle World Element Physics - Particles
  #for particle, i in physics.particles
    #Handle Container Element
  #  if particle.element is '#container'
  #    matrix3d = "matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, " + particle.pos.x + ", " + particle.pos.y + ", " + particle.pos.z + ", 1)"
  #    container.style.webkitTransform = matrix3d
    #Handle Messages Element
    #if particle.element is '#messages'
      #If the physics object matches the element we want, update it's positioning with the physics world values
      #matrix3d = "matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, " + particle.pos.x + ", " + particle.pos.y + ", " + particle.pos.z + ", 1)"
      #messages.style.webkitTransform = matrix3d

#Calculate Column Count
Deps.autorun(@calculateColumnCount = () ->
  columnCount = Math.round(Session.get('windowWidth')/tileWidth)
  #Reposition elements - we do this so aside from when a window is changing, we can actually use physics and don't have the
  #tiles constantly being repositioned, as that impacts the physics in a negative way. This way, it only happens when the columnCount
  #actually changes.

  if Session.get('columnCount') and !Session.equals('columnCount',columnCount)
    Session.set('columnCount',columnCount)
    ###switch columnCount
      when 1
        for particle, i in physics.particles
          if particle.element is '.tileWrapper'
            particle.moveTo oneColumnPos[i]
      when 2
        for particle, i in physics.particles
          if particle.element is '.tileWrapper'
            particle.moveTo twoColumnPos[i]
      when 3
        for particle, i in physics.particles
          if particle.element is '.tileWrapper'
            particle.moveTo threeColumnPos[i]
      when 4
        for particle, i in physics.particles
          if particle.element is '.tileWrapper'
            particle.moveTo fourColumnPos[i]
      when 5
        for particle, i in physics.particles
          if particle.element is '.tileWrapper'
            particle.moveTo fiveColumnPos[i]
      when 6
        for particle, i in physics.particles
          if particle.element is '.tileWrapper'
            particle.moveTo sixColumnPos[i]
      when 7
        for particle, i in physics.particles
          if particle.element is '.tileWrapper'
            particle.moveTo sevenColumnPos[i]
      when 8
        for particle, i in physics.particles
          if particle.element is '.tileWrapper'
            particle.moveTo eightColumnPos[i]
      when 9
        for particle, i in physics.particles
          if particle.element is '.tileWrapper'
            particle.moveTo nineColumnPos[i]
      when 10
        for particle, i in physics.particles
          if particle.element is '.tileWrapper'
            particle.moveTo tenColumnPos[i]
      else
        log 'Column Layout Error'###
  else
    Session.set('columnCount',columnCount)
)

#Calculate Column Widths
Deps.autorun(@calculateColumnWidth = () ->
  columnWidth = Math.round(Session.get('windowWidth')/Session.get('columnCount'))
  Session.set('columnWidth',columnWidth)
)

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

heartbeat = (timestamp) ->
  #log 'BEATING'
  #if Session.equals('appState','view')
  #  log 'Disabling scrolling'
  #  $('body').addClass('scrollingDisabled')
  #else
  #  log 'Enabling scrolling'
  #  $('body').removeClass('scrollingDisabled')

  #if Session.equals('tilesLoaded',true)
    #initGrid()
  #  calculateGrid()

  #Render Springs
  #ctx.clearRect(0, 0, canvas.width, canvas.height);
  #ctx.beginPath()
  #for s in physics.springs
  #  ctx.moveTo(s.p1.pos.x, s.p1.pos.y)
  #  ctx.lineTo(s.p2.pos.x, s.p2.pos.y)
  #ctx.stroke()
  #Step Physics
  physics.step()
  requestAnimationFrame heartbeat