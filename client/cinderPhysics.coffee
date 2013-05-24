@initPhysics = () ->
  log 'initPhysics'
  @physics = new Physics()
  height = Session.get('windowHeight')
  width = Session.get('windowWidth')
  renderTime = 0
  counter = 0

  min = new Vector(0.0,0.0)
  max = new Vector(width,height)

  #Set Physics Properties
  physics.integrator = new ImprovedEuler(null,null,4000)
  collide = new Collision()
  bounds = new EdgeBounce min, max

  attraction = [
    new Attraction(new Vector(1,1),4000,100)
    new Attraction(new Vector(400,0),4000,100)
    new Attraction(new Vector(800,0),4000,100)
    new Attraction(new Vector(1200,0),4000,100)
    new Attraction(new Vector(1600,0),4000,100)
    new Attraction(new Vector(0,150),4000,100)
    new Attraction(new Vector(400,150),4000,100)
    new Attraction(new Vector(800,150),4000,100)
    new Attraction(new Vector(1200,150),4000,100)
    new Attraction(new Vector(1600,150),4000,100)
    new Attraction(new Vector(0,300),4000,100)
    new Attraction(new Vector(400,300),4000,100)
    new Attraction(new Vector(800,300),4000,100)
    new Attraction(new Vector(1200,300),4000,100)
    new Attraction(new Vector(1600,300),4000,100)
    new Attraction(new Vector(0,450),4000,100)
    new Attraction(new Vector(400,450),4000,100)
    new Attraction(new Vector(800,450),4000,100)
    new Attraction(new Vector(1200,450),4000,100)
    new Attraction(new Vector(1600,450),4000,100)
    new Attraction(new Vector(0,600),4000,100)
    new Attraction(new Vector(400,600),4000,100)
    new Attraction(new Vector(800,600),4000,100)
    new Attraction(new Vector(1200,600),4000,100)
    new Attraction(new Vector(1600,600),4000,100)
    new Attraction(new Vector(0,750),4000,100)
    new Attraction(new Vector(400,750),4000,100)
    new Attraction(new Vector(800,750),4000,100)
  ]
  repulsion = [
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
    new Attraction(new Vector(0,0),4000,0)
  ]
  #log attraction
  #collision = new Collision()

  #Tile Physics
  tileWrapperCount = 28
  for i in [0...tileWrapperCount]
    log 'Pushing particles'
    #Create a Physics Instance for a tileWrapper
    tileParticle = new Particle()
    #tileParticle.width = 400
    #Give it collision
    #collision.pool.push tileParticle
    #Give it behaviours
    #log attraction[i]
    tileParticle.behaviours.push attraction[i]
    tileParticle.behaviours.push repulsion[i]
    tileParticle.behaviours.push bounds
    #tileParticle.fixed = true
    #log tileParticle.behaviours[0].target
    #Add Physics Instance to the simulation
    physics.particles.push tileParticle
    #We do this to initialize the particles and actually get them moving to their destination properly
    #physics.particles[i].pos.set(0,0)
    collide.pool.push tileParticle

  #Modal Physics
  modalRepulsion = new Attraction(new Vector(0,0),2000,-60000)
  modal = $('#modal')
  modalParticle = new Particle()
  modalParticle.behaviours.push modalRepulsion
  physics.particles.push modalParticle
  collide.pool.push modalParticle

  #PaneWrapper Physics
  PaneWrapperAttraction = new Attraction(new Vector(0,300),4000,0)
  PaneWrapper = $('#PaneWrapper')
  paneWrapperParticle = new Particle()
  paneWrapperParticle.behaviours.push PaneWrapperAttraction
  physics.particles.push paneWrapperParticle


  ###setup: (full = yes) ->
    #Override and add paticles / springs here
  #Initialise the demo (override).
  init: (@container, @renderer = new DOMRenderer()) ->
    # Build the scene.
    @setup renderer.gl?
    # Give the particles random colours.
    for particle in @physics.particles
      particle.colour ?= Random.item Demo.COLOURS
    # Add event handlers.
    document.addEventListener 'touchmove', @mousemove, false
    document.addEventListener 'mousemove', @mousemove, false
    document.addEventListener 'resize', @resize, false
    # Add to render output to the DOM.
    @container.appendChild @renderer.domElement
    # Prepare the renderer.
    @renderer.mouse = @mouse
    @renderer.init @physics
    # Resize for the sake of the renderer.
    do @resize
  #Handler for window resize event.
  resize: (event) =>
    @width = window.innerWidth
    @height = window.innerHeight
    @renderer.setSize @width, @height
  #Update loop.
  step: ->
    #console.profile 'physics'
    # Step physics.
    do @physics.step
    #console.profileEnd()
    #console.profile 'render'
    # Render.
    # Render every frame for WebGL, or every 3 frames for canvas.
    @renderer.render @physics if @renderer.gl? or ++@counter % 3 is 0
    #console.profileEnd()
  #Clean up after yourself.
  destroy: ->
    ## console.log @, 'destroy'
    # Remove event handlers.
    document.removeEventListener 'touchmove', @mousemove, false
    document.removeEventListener 'mousemove', @mousemove, false
    document.removeEventListener 'resize', @resize, false
    # Remove the render output from the DOM.
    try container.removeChild @renderer.domElement
    catch error
    do @renderer.destroy
    do @physics.destroy
    @renderer = null
    @physics = null
    @mouse = null
  #Handler for window mousemove event.
  mousemove: (event) =>
    do event.preventDefault
    if event.touches and !!event.touches.length
      touch = event.touches[0]
      @mouse.pos.set touch.pageX, touch.pageY
    else
      @mouse.pos.set event.clientX, event.clientY###