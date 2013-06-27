@initPhysics = () ->
    log 'initPhysics'
    @physics = new Physics()
    @physics.integrator = new Verlet()
    renderTime = 0
    counter = 0

    log 'Physics world initialized'

    #Set initial particle colors
    @COLOURS = ['2b3d4f', '374e65', '496786', '728294', '8593a3', '99a4b1', '54606e', '637181', '728294']
    @OPACITY = [0.1,0.2,0.3,0.4,0.5]

    #Set the width and height
    windowWidth = Session.get('windowWidth')
    windowHeight = Session.get('windowHeight')

    #Set the window bounds
    min = new Vector 0.0, 0.0
    max = new Vector(windowWidth,windowHeight)

    edge = new EdgeWrap min, max
    #collide = new Collision()

    #Set the parent DOM element
    @domElement = document.querySelector('#particles')

    #if physics.particles.length is 0

    for i in [0...200]

        #Size Modifiers
        widthMod = Randall(5,50)
        heightMod = Randall(5,50)
        borderMod = Randall(10,50)

        p = new Particle(Randall(0.5, 4.0))
        p.width = widthMod
        p.height = heightMod
        p.borderRadius = borderMod

        p.moveTo new Vector(Randall(windowWidth), Randall(windowHeight), 0)

        p.behaviours.push new Wander(0.2, 120, Randall(1.0), 2.0)
        p.behaviours.push edge

        @physics.particles.push p

        #Append the element to the DOM
        el = document.createElement 'span'
        el.className = 'particle'
        st = el.style
        st.position = 'absolute'
        st.width = widthMod + 'px'
        st.height = heightMod + 'px'
        st.borderRadius = borderMod + 'px'
        st.background = '#' + Randall.item(COLOURS)
        st.opacity = Randall.item(OPACITY)
        @domElement.appendChild el
        #p.domElement = el

        @particles = document.querySelectorAll('.particle')
        Session.set('physicsInitialized',true)

@updatePhysics = () ->
    #log 'updatingPhysics'
    windowWidth = Session.get('windowWidth')
    windowHeight = Session.get('windowHeight')

    #Update the EdgeWrap behaviour
    for particle, i in physics.particles
        #log 'looping'
        particle.behaviours[1].max.set(new Vector(windowWidth,windowHeight))
        particle.moveTo new Vector(Randall(windowWidth), Randall(windowHeight), 0)