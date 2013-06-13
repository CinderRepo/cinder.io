@initPhysics = () ->
    log 'initPhysics'
    @physics = new Physics()
    physics.integrator = new Verlet()
    renderTime = 0
    counter = 0

    log 'Physics world initialized'

    #Column Layout Positions
    ###@oneColumnPos = [
        new Vector(0,0,0)
        new Vector(0,385,0)
        new Vector(0,770,0)
        new Vector(0,1155,0)
        new Vector(0,1540,0)
        new Vector(0,1925,0)
        new Vector(0,2310,0)
        new Vector(0,2695,0)
        new Vector(0,3080,0)
        new Vector(0,3465,0)
        new Vector(0,3850,0)
        new Vector(0,4235,0)
        new Vector(0,4620,0)
        new Vector(0,5005,0)
        new Vector(0,5390,0)
        new Vector(0,5775,0)
        new Vector(0,6160,0)
        new Vector(0,6545,0)
        new Vector(0,6930,0)
        new Vector(0,7315,0)
        new Vector(0,7700,0)
        new Vector(0,8085,0)
        new Vector(0,8470,0)
        new Vector(0,8855,0)
        new Vector(0,9240,0)
        new Vector(0,9625,0)
        new Vector(0,10010,0)
        new Vector(0,10395,0)
    ]
    @twoColumnPos = [
        new Vector(0,0,0)
        new Vector(400,0,0)
        new Vector(0,385,0)
        new Vector(400,385,0)
        new Vector(0,770,0)
        new Vector(400,770,0)
        new Vector(0,1155,0)
        new Vector(400,1155,0)
        new Vector(0,1540,0)
        new Vector(400,1540,0)
        new Vector(0,1925,0)
        new Vector(400,1925,0)
        new Vector(0,2310,0)
        new Vector(400,2310,0)
        new Vector(0,2695,0)
        new Vector(400,2695,0)
        new Vector(0,3080,0)
        new Vector(400,3080,0)
        new Vector(0,3465,0)
        new Vector(400,3465,0)
        new Vector(0,3850,0)
        new Vector(400,3850,0)
        new Vector(0,4235,0)
        new Vector(400,4235,0)
        new Vector(0,4620,0)
        new Vector(400,4620,0)
        new Vector(0,5005,0)
        new Vector(400,5005,0)
    ]
    @threeColumnPos = [
        new Vector(0,0,0)
        new Vector(400,0,0)
        new Vector(800,0,0)
        new Vector(0,385,0)
        new Vector(400,385,0)
        new Vector(800,385,0)
        new Vector(0,770,0)
        new Vector(400,770,0)
        new Vector(800,770,0)
        new Vector(0,1155,0)
        new Vector(400,1155,0)
        new Vector(800,1155,0)
        new Vector(0,1540,0)
        new Vector(400,1540,0)
        new Vector(800,1540,0)
        new Vector(0,1925,0)
        new Vector(400,1925,0)
        new Vector(800,1925,0)
        new Vector(0,2310,0)
        new Vector(400,2310,0)
        new Vector(800,2310,0)
        new Vector(0,2695,0)
        new Vector(400,2695,0)
        new Vector(800,2695,0)
        new Vector(0,3080,0)
        new Vector(400,3080,0)
        new Vector(800,3080,0)
        new Vector(0,3465,0)
        new Vector(400,3465,0)
        new Vector(800,3465,0)
    ]
    @fourColumnPos = [
        new Vector(0,0,0)
        new Vector(400,0,0)
        new Vector(800,0,0)
        new Vector(1200,0,0)
        new Vector(0,385,0)
        new Vector(400,385,0)
        new Vector(800,385,0)
        new Vector(1200,385,0)
        new Vector(0,770,0)
        new Vector(400,770,0)
        new Vector(800,770,0)
        new Vector(1200,770,0)
        new Vector(0,1155,0)
        new Vector(400,1155,0)
        new Vector(800,1155,0)
        new Vector(1200,1155,0)
        new Vector(0,1540,0)
        new Vector(400,1540,0)
        new Vector(800,1540,0)
        new Vector(1200,1540,0)
        new Vector(0,1925,0)
        new Vector(400,1925,0)
        new Vector(800,1925,0)
        new Vector(1200,1925,0)
        new Vector(0,2310,0)
        new Vector(400,2310,0)
        new Vector(800,2310,0)
        new Vector(1200,2310,0)
    ]
    @fiveColumnPos = [
        new Vector(0,0,0)
        new Vector(400,0,0)
        new Vector(800,0,0)
        new Vector(1200,0,0)
        new Vector(1600,0,0)
        new Vector(0,385,0)
        new Vector(400,385,0)
        new Vector(800,385,0)
        new Vector(1200,385,0)
        new Vector(1600,385,0)
        new Vector(0,770,0)
        new Vector(400,770,0)
        new Vector(800,770,0)
        new Vector(1200,770,0)
        new Vector(1600,770,0)
        new Vector(0,1155,0)
        new Vector(400,1155,0)
        new Vector(800,1155,0)
        new Vector(1200,1155,0)
        new Vector(1600,1155,0)
        new Vector(0,1540,0)
        new Vector(400,1540,0)
        new Vector(800,1540,0)
        new Vector(1200,1540,0)
        new Vector(1600,1540,0)
        new Vector(0,1925,0)
        new Vector(400,1925,0)
        new Vector(800,1925,0)
    ]
    @sixColumnPos = [
        new Vector(0,0,0)
        new Vector(400,0,0)
        new Vector(800,0,0)
        new Vector(1200,0,0)
        new Vector(1600,0,0)
        new Vector(2000,0,0)
        new Vector(0,385,0)
        new Vector(400,385,0)
        new Vector(800,385,0)
        new Vector(1200,385,0)
        new Vector(1600,385,0)
        new Vector(2000,385,0)
        new Vector(0,770,0)
        new Vector(400,770,0)
        new Vector(800,770,0)
        new Vector(1200,770,0)
        new Vector(1600,770,0)
        new Vector(2000,770,0)
        new Vector(0,1155,0)
        new Vector(400,1155,0)
        new Vector(800,1155,0)
        new Vector(1200,1155,0)
        new Vector(1600,1155,0)
        new Vector(2000,1155,0)
        new Vector(0,1540,0)
        new Vector(400,1540,0)
        new Vector(800,1540,0)
        new Vector(1200,1540,0)
    ]
    @sevenColumnPos = [
        new Vector(0,0,0)
        new Vector(400,0,0)
        new Vector(800,0,0)
        new Vector(1200,0,0)
        new Vector(1600,0,0)
        new Vector(2000,0,0)
        new Vector(2400,0,0)
        new Vector(0,385,0)
        new Vector(400,385,0)
        new Vector(800,385,0)
        new Vector(1200,385,0)
        new Vector(1600,385,0)
        new Vector(2000,385,0)
        new Vector(2400,385,0)
        new Vector(0,770,0)
        new Vector(400,770,0)
        new Vector(800,770,0)
        new Vector(1200,770,0)
        new Vector(1600,770,0)
        new Vector(2000,770,0)
        new Vector(2400,770,0)
        new Vector(0,1155,0)
        new Vector(400,1155,0)
        new Vector(800,1155,0)
        new Vector(1200,1155,0)
        new Vector(1600,1155,0)
        new Vector(2000,1155,0)
        new Vector(2400,1155,0)
    ]
    @eightColumnPos = [
        new Vector(0,0,0)
        new Vector(400,0,0)
        new Vector(800,0,0)
        new Vector(1200,0,0)
        new Vector(1600,0,0)
        new Vector(2000,0,0)
        new Vector(2400,0,0)
        new Vector(2800,0,0)
        new Vector(0,385,0)
        new Vector(400,385,0)
        new Vector(800,385,0)
        new Vector(1200,385,0)
        new Vector(1600,385,0)
        new Vector(2000,385,0)
        new Vector(2400,385,0)
        new Vector(2800,385,0)
        new Vector(0,770,0)
        new Vector(400,770,0)
        new Vector(800,770,0)
        new Vector(1200,770,0)
        new Vector(1600,770,0)
        new Vector(2000,770,0)
        new Vector(2400,770,0)
        new Vector(2800,770,0)
        new Vector(0,1155,0)
        new Vector(400,1155,0)
        new Vector(800,1155,0)
        new Vector(1200,1155,0)
    ]
    @nineColumnPos = [
        new Vector(0,0,0)
        new Vector(400,0,0)
        new Vector(800,0,0)
        new Vector(1200,0,0)
        new Vector(1600,0,0)
        new Vector(2000,0,0)
        new Vector(2400,0,0)
        new Vector(2800,0,0)
        new Vector(3200,0,0)
        new Vector(0,385,0)
        new Vector(400,385,0)
        new Vector(800,385,0)
        new Vector(1200,385,0)
        new Vector(1600,385,0)
        new Vector(2000,385,0)
        new Vector(2400,385,0)
        new Vector(2800,385,0)
        new Vector(3200,385,0)
        new Vector(0,770,0)
        new Vector(400,770,0)
        new Vector(800,770,0)
        new Vector(1200,770,0)
        new Vector(1600,770,0)
        new Vector(2000,770,0)
        new Vector(2400,770,0)
        new Vector(2800,770,0)
        new Vector(3200,770,0)
        new Vector(0,1155,0)
    ]
    @tenColumnPos = [
        new Vector(0,0,0)
        new Vector(400,0,0)
        new Vector(800,0,0)
        new Vector(1200,0,0)
        new Vector(1600,0,0)
        new Vector(2000,0,0)
        new Vector(2400,0,0)
        new Vector(2800,0,0)
        new Vector(3200,0,0)
        new Vector(3600,0,0)
        new Vector(0,385,0)
        new Vector(400,385,0)
        new Vector(800,385,0)
        new Vector(1200,385,0)
        new Vector(1600,385,0)
        new Vector(2000,385,0)
        new Vector(2400,385,0)
        new Vector(2800,385,0)
        new Vector(3200,385,0)
        new Vector(3600,385,0)
        new Vector(0,770,0)
        new Vector(400,770,0)
        new Vector(800,770,0)
        new Vector(1200,770,0)
        new Vector(1600,770,0)
        new Vector(2000,770,0)
        new Vector(2400,770,0)
        new Vector(3200,770,0)
    ]###

    #Set Physics Properties
    #physics.integrator = new Verlet()
    #collision = new Collision()
    #columnWidth = Session.get('columnWidth')
    #columnCount = Session.get('columnCount')
    #log columnWidth

    #collision = new RigidCollision()

    #Tile Physics
    #tileWrapperCount = 28
    #for i in [0...tileWrapperCount]
    #    log 'Pushing particles'

        #Anchors
    #    anchor = new Particle()
    #    anchor.fixed = true

        #Particle
    #    particle = new Particle()
    #    particle.mass = 400
    #    particle.element = '.tileWrapper'

        #Position particles based on layout
    #    switch columnCount
    #        when 1
    #            particle.moveTo oneColumnPos[i]
    #        when 2
    #            particle.moveTo twoColumnPos[i]
    #        when 3
    #            particle.moveTo threeColumnPos[i]
    #        when 4
    #            particle.moveTo fourColumnPos[i]
    #        when 5
    #            particle.moveTo fiveColumnPos[i]
    #        when 6
    #            particle.moveTo sixColumnPos[i]
    #        when 7
    #            particle.moveTo sevenColumnPos[i]
    #        when 8
    #            particle.moveTo eightColumnPos[i]
    #        when 9
    #            particle.moveTo nineColumnPos[i]
    #        when 10
    #            particle.moveTo tenColumnPos[i]
    #        else
    #            log 'Column Layout Error'

        #log particle
        #spring = new Spring(anchor, particle, 0, 0.5)
        #physics.springs.push spring

        #Screen Attraction - The Z Value is set by the client upon initialization
        #screenAttraction = new Attraction(new Vector(Session.get('windowWidth')/2,Session.get('windowHeight')/2,0),100000,0)

        #Constant force to push the element forward
        #force = new ConstantForce(new Vector(0,0,0))
        #particle.behaviours.push force

        #screenAttraction = new Attraction(new Vector(0,0,40),10000000000,0)
        #particle.behaviours.push screenAttraction

        #Bottom Attraction
        #bottomAttraction = new Attraction(new Vector(100,100,100),4000,1000)
        #particle.behaviours.push bottomAttraction

        #Bounds Collision
        #min = new Vector(0,0,-10)
        #max = new Vector(Session.get('windowWidth'),Session.get('windowHeight'),30)

        #bounds = new EdgeBounce min, max
        #particle.behaviours.push bounds

        #Repulse Attraction
        #repulseAttraction = new Attraction(new Vector(Session.get('windowWidth')/2,Session.get('windowHeight')/2,0),4000,0)
        #particle.behaviours.push repulseAttraction

        #Mouse Attraction
        #mouseAttraction = new Attraction(new Vector(0,0,0),4000,0)
        #particle.behaviours.push mouseAttraction

        #Add particles and springs to physics world
        #physics.particles.push particle

    #Push physics to the container element
    #container = new Particle()
    #container.mass = 400
    #container.element = '#container'

    #Anchor Container to a spring
    #anchor = new Particle()
    #anchor.fixed = true

    #Anchor Messages to a spring
    #spring = new Spring(anchor, container, 0, 0.5)
    #spring.element = '#container'
    #physics.springs.push spring

    #Apply a downward force
    #force = new ConstantForce(new Vector(0,1,0))
    #container.behaviours.push force

    #Add container to the physics world
    #physics.particles.push container

    #Push physics to the messages element
    #messages = new Particle()
    #messages.mass = 400
    #messages.moveTo = new Vector(0,1000,0)
    #messages.element = '#messages'

    #anchor = new Particle()
    #anchor.fixed = true

    #Anchor Messages to a spring
    #spring = new Spring(anchor, messages, 0, 0.5)
    #spring.element = '#messages'
    #physics.springs.push spring

    #Apply a downward force
    #force = new ConstantForce(new Vector(0,1,0))
    #messages.behaviours.push force

    #Add messages to the physics world
    #physics.particles.push messages


    #Render Springs
    #@canvas = $('#canvas')[0]
    #canvas.width = Session.get('windowWidth')
    #canvas.height = Session.get('windowHeight') - 80
    #@ctx = canvas.getContext('2d')
    #ctx.strokeStyle = 'red'