#Tile Dimensions
@tilesPerspective = 100
@tileWidth = 400
@tileHeight = 150

Meteor.startup(()->
  console.log 'Hello Client!'
  #Session.setDefault('activeTile',null)
  Session.setDefault('appState','browse')
  #logRenders()
  #Session.setDefault('appState','/')
  #Set Session variables
  #Session.set('activeModal',undefined)
  #Session.set('activePane','browse')
  #Session.set('revealedDown',false)
  #Session.set('revealedDownHeight',undefined)

  #logRenders()
  #Meteor.setTimeout(()->
      #initGrid()
  #1000)
  #initGrid()
  #Calculate windowWidth for grid dimensions
  getWindowSize()
  #initialize physics
  initPhysics()
  #Start client request animation frame heartbeat
  heartbeat()
)

logRenders = ->
  _.each Template, (template, name) ->
    oldRender = template.rendered
    counter = 0
    template.rendered = ->
      console.log name, "render count: ", ++counter
      oldRender and oldRender.apply(this, arguments_)

@initGrid = () ->
  log 'initGrid'
  unless Session.equals('tileLoaded',true)
    #log 'TILEWRAPPER INITTING'
    #log $('.tileWrapper')
    #log $('.tileWrapper').length
    #We set a global so that we can access the tileWrappers in other functions, as well as the perspective and ideal tile width.
    @tilesContainer = $('#tiles')[0]
    @tileWrappers = $('.tileWrapper')

calculateGrid = () ->
  #log 'calculateGrid'
  columnCount = Session.get('columnCount')
  columnWidth = Session.get('columnWidth')
  #activeTile = Session.get('activeTile')
  #This is where we calculate the proper translation values based on the ideal dimensions we want for the tile.
  #log tileWidth
  #log tilesPerspective
  #log columnWidth

  #Handle Column Placement positioning
  tileWrappers.each((i)->
    if Session.equals('appState','browse')
      #log 'Browse!'
      #tileWidth = 380
      #Update the repel strength to bring the tiles back
      physics.particles[i].behaviours[0].strength = 200
      physics.particles[i].behaviours[1].strength = 0
    else if Session.equals('appState','preview')
      #log 'Preview!'
      #tileWidth = Session.get('windowWidth')
      if $(this).attr('id') is Session.get('activeTile')
        #Update the attraction strength at the top of the screen to attract the active tile upwards
        physics.particles[i].behaviours[0].strength = 0
        physics.particles[i].behaviours[1].strength = 200
      else
        #Update the repel strength to fire the tiles away, except for the active tile
        physics.particles[i].behaviours[0].strength = 0
        #physics.particles[i].behaviours[1].strength = -200
    #Set the height variable if there is an activeTile
    ###if Session.get('activeTile')
      activeTile = true
      #We get the value of the activeTile so we can use it for our height calculations
      activeTileTranslateZValue = -(((tileWidth*tilesPerspective)/Session.get('windowWidth'))-tilesPerspective)
      translateZValue = -(((tileWidth*tilesPerspective)/columnWidth)-tilesPerspective)
      #log translateZValue
      Session.set('test2',activeTileTranslateZValue)
      #There is an activeTile
      expandedTileHeight = tileHeight*(tilesPerspective/(tilesPerspective-activeTileTranslateZValue))
      currentTileHeight = if activeTile then expandedTileHeight else tileHeight
      Session.set('test',expandedTileHeight)
      Session.set('test3',currentTileHeight)
    else
      currentTileHeight = tileHeight

    if $(this).attr('id') is Session.get('activeTile')
      #log '!!!!!'
      #log i
      currentTileIndex = i###
      #log 'Checking currentTileIndex ' + currentTileIndex

    ###if columnCount is 1 #One Column Layout
      if i % columnCount is 0 #First Column
        translateXValue = 0
        translateYValue = tileHeight*i
    if columnCount is 2 #Two Column Layout
      if i % columnCount is 0 #First Column
        translateXValue = 0
        translateYValue = ((tileHeight*i)/columnCount)
      if i % columnCount is 1 #Second Column
        translateXValue = tileWidth
        translateYValue = ((tileHeight*i - tileHeight)/columnCount)
    if columnCount is 3 #Three Column Layout
      if i % columnCount is 0 #First Column
        translateXValue = 0
        translateYValue = ((tileHeight*i)/columnCount)
      if i % columnCount is 1 #Second Column
        translateXValue = tileWidth
        translateYValue = ((tileHeight*i - tileHeight)/columnCount)
      if i % columnCount is 2 #Third Column
        translateXValue = tileWidth*2
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-1))/columnCount)
    if columnCount is 4 #Four Column Layout
      if i % columnCount is 0 #First Column
        translateXValue = 0
        translateYValue = ((tileHeight*i)/columnCount)
      if i % columnCount is 1 #Second Column
        translateXValue = tileWidth
        translateYValue = ((tileHeight*i - tileHeight)/columnCount)
      if i % columnCount is 2 #Third Column
        translateXValue = tileWidth*2
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-2))/columnCount)
      if i % columnCount is 3 #Fourth Column
        translateXValue = tileWidth*3
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-1))/columnCount)
    if columnCount is 5 #Five Column Layout
      if i % columnCount is 0 #First Column
        translateXValue = 0
        translateYValue = ((tileHeight*i)/columnCount)
      if i % columnCount is 1 #Second Column
        translateXValue = tileWidth
        translateYValue = ((tileHeight*i - tileHeight)/columnCount)
      if i % columnCount is 2 #Third Column
        translateXValue = tileWidth*2
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-3))/columnCount)
      if i % columnCount is 3 #Fourth Column
        translateXValue = tileWidth*3
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-2))/columnCount)
      if i % columnCount is 4 #Fifth Column
        translateXValue = tileWidth*4
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-1))/columnCount)
    if columnCount is 6 #Six Column Layout
      if i % columnCount is 0 #First Column
        translateXValue = 0
        translateYValue = ((tileHeight*i)/columnCount)
      if i % columnCount is 1 #Second Column
        translateXValue = tileWidth
        translateYValue = ((tileHeight*i - tileHeight)/columnCount)
      if i % columnCount is 2 #Third Column
        translateXValue = tileWidth*2
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-4))/columnCount)
      if i % columnCount is 3 #Fourth Column
        translateXValue = tileWidth*3
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-3))/columnCount)
      if i % columnCount is 4 #Fifth Column
        translateXValue = tileWidth*4
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-2))/columnCount)
      if i % columnCount is 5 #Sixth Column
        translateXValue = tileWidth*5
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-1))/columnCount)
    if columnCount is 7 #Seven Column Layout
      if i % columnCount is 0 #First Column
        translateXValue = 0
        translateYValue = ((tileHeight*i)/columnCount)
      if i % columnCount is 1 #Second Column
        translateXValue = tileWidth
        translateYValue = ((tileHeight*i - tileHeight)/columnCount)
      if i % columnCount is 2 #Third Column
        translateXValue = tileWidth*2
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-5))/columnCount)
      if i % columnCount is 3 #Fourth Column
        translateXValue = tileWidth*3
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-4))/columnCount)
      if i % columnCount is 4 #Fifth Column
        translateXValue = tileWidth*4
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-3))/columnCount)
      if i % columnCount is 5 #Sixth Column
        translateXValue = tileWidth*5
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-2))/columnCount)
      if i % columnCount is 6 #Seventh Column
        translateXValue = tileWidth*6
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-1))/columnCount)
    if columnCount is 8 #Eight Column Layout
      if i % columnCount is 0 #First Column
        translateXValue = 0
        translateYValue = ((tileHeight*i)/columnCount)
      if i % columnCount is 1 #Second Column
        translateXValue = tileWidth
        translateYValue = ((tileHeight*i - tileHeight)/columnCount)
      if i % columnCount is 2 #Third Column
        translateXValue = tileWidth*2
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-6))/columnCount)
      if i % columnCount is 3 #Fourth Column
        translateXValue = tileWidth*3
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-5))/columnCount)
      if i % columnCount is 4 #Fifth Column
        translateXValue = tileWidth*4
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-4))/columnCount)
      if i % columnCount is 5 #Sixth Column
        translateXValue = tileWidth*5
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-3))/columnCount)
      if i % columnCount is 6 #Seventh Column
        translateXValue = tileWidth*6
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-2))/columnCount)
      if i % columnCount is 7 #Eighth Column
        translateXValue = tileWidth*7
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-1))/columnCount)
    if columnCount is 9 #Nine Column Layout
      if i % columnCount is 0 #First Column
        translateXValue = 0
        translateYValue = ((tileHeight*i)/columnCount)
      if i % columnCount is 1 #Second Column
        translateXValue = tileWidth
        translateYValue = ((tileHeight*i - tileHeight)/columnCount)
      if i % columnCount is 2 #Third Column
        translateXValue = tileWidth*2
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-7))/columnCount)
      if i % columnCount is 3 #Fourth Column
        translateXValue = tileWidth*3
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-6))/columnCount)
      if i % columnCount is 4 #Fifth Column
        translateXValue = tileWidth*4
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-5))/columnCount)
      if i % columnCount is 5 #Sixth Column
        translateXValue = tileWidth*5
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-4))/columnCount)
      if i % columnCount is 6 #Seventh Column
        translateXValue = tileWidth*6
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-3))/columnCount)
      if i % columnCount is 7 #Eighth Column
        translateXValue = tileWidth*7
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-2))/columnCount)
      if i % columnCount is 8 #Ninth Column
        translateXValue = tileWidth*8
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-1))/columnCount)
    if columnCount is 10 #Ten Column Layout
      if i % columnCount is 0 #First Column
        translateXValue = 0
        translateYValue = ((tileHeight*i)/columnCount)
      if i % columnCount is 1 #Second Column
        translateXValue = tileWidth
        translateYValue = ((tileHeight*i - tileHeight)/columnCount)
      if i % columnCount is 2 #Third Column
        translateXValue = tileWidth*2
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-8))/columnCount)
      if i % columnCount is 3 #Fourth Column
        translateXValue = tileWidth*3
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-7))/columnCount)
      if i % columnCount is 4 #Fifth Column
        translateXValue = tileWidth*4
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-6))/columnCount)
      if i % columnCount is 5 #Sixth Column
        translateXValue = tileWidth*5
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-5))/columnCount)
      if i % columnCount is 6 #Seventh Column
        translateXValue = tileWidth*6
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-4))/columnCount)
      if i % columnCount is 7 #Eighth Column
        translateXValue = tileWidth*7
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-3))/columnCount)
      if i % columnCount is 8 #Ninth Column
        translateXValue = tileWidth*8
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-2))/columnCount)
      if i % columnCount is 9 #Tenth Column
        translateXValue = tileWidth*9
        translateYValue = ((tileHeight*i - tileHeight*(columnCount-1))/columnCount)###

    #If there is an activeTile and it matches, calculate the translateZValue from the windowWidth
    #Or the columnWidth accordingly.
    if Session.get('activeTile') and $(this).attr('id') is Session.get('activeTile')
      #log 'activeTIle'
      #There is an activeTile and this tile is active
      #translateXValue = 0
      #translateYValue = 0
      translateZValue = -(((tileWidth*tilesPerspective)/Session.get('windowWidth'))-tilesPerspective)
    else
      #log 'NoActiveTile'
      #There are no activeTiles
      if Session.equals('appState','view')
        #log 'MAKING IT TINY'
        translateZValue = -10000
      else
        #log 'UHHH AN ELSE?'
        translateZValue = -(((tileWidth*tilesPerspective)/columnWidth)-tilesPerspective)
      #currentTileHeight = 0

    #Calculate the final webkitTransform
    #log translateZValue
    matrix3d = "matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, " + physics.particles[i].pos.x + ", " + physics.particles[i].pos.y + ", " + translateZValue + ", 1)"
    this.style.webkitTransform = matrix3d

    #We have to have the wrapper element have the opposite translation, so that people can still click on elements contained within it.
    inverseMatrix3d = "matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, " + 0 + ", " + 0 + ", " + -translateZValue + ", 1)"
    tilesContainer.style.webkitTransform = inverseMatrix3d
    #tilesContainer.style.paddingTop = currentTileHeight + 'px'
  )
  tilesBackground = $('.tilesBackground')
  if Session.equals('appState','play')
    tilesBackground[0].style.webkitTransform = "matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, " + 0+ ", " + 0 + ", " + -10000 + ", 1)"
    tilesBackground[0].style.opacity = 0
  else
    tilesBackground[0].style.webkitTransform = "matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, " + 0+ ", " + 0 + ", " + 0 + ", 1)"
    tilesBackground[0].style.opacity = 1

  paneWrapper = $('#paneWrapper')
  paneWrapper[0].style.webkitTransform = "matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, " + physics.particles[29].pos.x + ", " + physics.particles[29].pos.y + ", " + 0 + ", 1)"

Deps.autorun(calculateColumnCount = () ->
  #console.log 'calculateColumnCount..'
  columnCount = Math.round(Session.get('windowWidth')/tileWidth)
  Session.set('columnCount',columnCount)
)

Deps.autorun(calculateColumnWidth = () ->
  #console.log 'calculateColumnWidth..'
  columnWidth = Math.round(Session.get('windowWidth')/Session.get('columnCount'))
  Session.set('columnWidth',columnWidth)
)

heartbeat = (timestamp) ->
  #log 'BEATING'
  if Session.equals('tileLoaded',true)
    calculateGrid()
  if Session.equals('modalState','login') or Session.equals('modalState','add')
    log 'WHAT THE SHIT'
    physics.particles[29].behaviours[0].strength = 2000
  else
    log 'WHAT THE FUCK'
    physics.particles[29].behaviours[0].strength = 0
  #Step Physics
  physics.step()
  ###if Session.equals('appState','preview')
    log 'PREVIEW'
  if Session.equals('appState','browse')
    log 'BROWSE'###
  requestAnimationFrame heartbeat