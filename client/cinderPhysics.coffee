@initPhysics = () ->
  log 'initPhysics'
  @physics = new Physics()
  renderTime = 0
  counter = 0

  min = new Vector(0.0,0.0)
  max = new Vector(Session.get('windowWidth'),Session.get('windowHeight'))

  #Set Physics Properties
  physics.integrator = new Verlet()
  collision = new Collision()
  bounds = new EdgeBounce min, max

  attraction = [
    new Attraction(new Vector(1,1),4000,400)
    new Attraction(new Vector(400,0),4000,400)
    new Attraction(new Vector(800,0),4000,400)
    new Attraction(new Vector(1200,0),4000,400)
    new Attraction(new Vector(1600,0),4000,400)
    new Attraction(new Vector(0,150),4000,400)
    new Attraction(new Vector(400,150),4000,400)
    new Attraction(new Vector(800,150),4000,400)
    new Attraction(new Vector(1200,150),4000,400)
    new Attraction(new Vector(1600,150),4000,400)
    new Attraction(new Vector(0,300),4000,400)
    new Attraction(new Vector(400,300),4000,400)
    new Attraction(new Vector(800,300),4000,400)
    new Attraction(new Vector(1200,300),4000,400)
    new Attraction(new Vector(1600,300),4000,400)
    new Attraction(new Vector(0,450),4000,400)
    new Attraction(new Vector(400,450),4000,400)
    new Attraction(new Vector(800,450),4000,400)
    new Attraction(new Vector(1200,450),4000,400)
    new Attraction(new Vector(1600,450),4000,400)
    new Attraction(new Vector(0,600),4000,400)
    new Attraction(new Vector(400,600),4000,400)
    new Attraction(new Vector(800,600),4000,400)
    new Attraction(new Vector(1200,600),4000,400)
    new Attraction(new Vector(1600,600),4000,400)
    new Attraction(new Vector(0,750),4000,400)
    new Attraction(new Vector(400,750),4000,400)
    new Attraction(new Vector(800,750),4000,400)
  ]

  magnet = [
    new Magnet(new Vector(0,0),4000,400)
    new Magnet(new Vector(400,0),4000,400)
    new Magnet(new Vector(800,0),4000,400)
    new Magnet(new Vector(1200,0),4000,400)
    new Magnet(new Vector(1600,0),4000,400)
    new Magnet(new Vector(0,150),4000,400)
    new Magnet(new Vector(400,150),4000,400)
    new Magnet(new Vector(800,150),4000,400)
    new Magnet(new Vector(1200,150),4000,400)
    new Magnet(new Vector(1600,150),4000,400)
    new Magnet(new Vector(0,300),4000,400)
    new Magnet(new Vector(400,300),4000,400)
    new Magnet(new Vector(800,300),4000,400)
    new Magnet(new Vector(1200,300),4000,400)
    new Magnet(new Vector(1600,300),4000,400)
    new Magnet(new Vector(0,450),4000,400)
    new Magnet(new Vector(400,450),4000,400)
    new Magnet(new Vector(800,450),4000,400)
    new Magnet(new Vector(1200,450),4000,400)
    new Magnet(new Vector(1600,450),4000,400)
    new Magnet(new Vector(0,600),4000,400)
    new Magnet(new Vector(400,600),4000,400)
    new Magnet(new Vector(800,600),4000,400)
    new Magnet(new Vector(1200,600),4000,400)
    new Magnet(new Vector(1600,600),4000,400)
    new Magnet(new Vector(0,750),4000,400)
    new Magnet(new Vector(400,750),4000,400)
    new Magnet(new Vector(800,750),4000,400)
  ]

  jiffyLube = [
    new JiffyLube(new Vector(0,0),4000,400)
    new JiffyLube(new Vector(400,0),4000,400)
    new JiffyLube(new Vector(800,0),4000,400)
    new JiffyLube(new Vector(1200,0),4000,400)
    new JiffyLube(new Vector(1600,0),4000,400)
    new JiffyLube(new Vector(0,150),4000,400)
    new JiffyLube(new Vector(400,150),4000,400)
    new JiffyLube(new Vector(800,150),4000,400)
    new JiffyLube(new Vector(1200,150),4000,400)
    new JiffyLube(new Vector(1600,150),4000,400)
    new JiffyLube(new Vector(0,300),4000,400)
    new JiffyLube(new Vector(400,300),4000,400)
    new JiffyLube(new Vector(800,300),4000,400)
    new JiffyLube(new Vector(1200,300),4000,400)
    new JiffyLube(new Vector(1600,300),4000,400)
    new JiffyLube(new Vector(0,450),4000,400)
    new JiffyLube(new Vector(400,450),4000,400)
    new JiffyLube(new Vector(800,450),4000,400)
    new JiffyLube(new Vector(1200,450),4000,400)
    new JiffyLube(new Vector(1600,450),4000,400)
    new JiffyLube(new Vector(0,600),4000,400)
    new JiffyLube(new Vector(400,600),4000,400)
    new JiffyLube(new Vector(800,600),4000,400)
    new JiffyLube(new Vector(1200,600),4000,400)
    new JiffyLube(new Vector(1600,600),4000,400)
    new JiffyLube(new Vector(0,750),4000,400)
    new JiffyLube(new Vector(400,750),4000,400)
    new JiffyLube(new Vector(800,750),4000,400)
  ]

  position = [
    new Vector(0,0)
    new Vector(400,0)
    new Vector(800,0)
    new Vector(1200,0)
    new Vector(1600,0)
    new Vector(0,150)
    new Vector(400,150)
    new Vector(800,150)
    new Vector(1200,150)
    new Vector(1600,150)
    new Vector(0,300)
    new Vector(400,300)
    new Vector(800,300)
    new Vector(1200,300)
    new Vector(1600,300)
    new Vector(0,450)
    new Vector(400,450)
    new Vector(800,450)
    new Vector(1200,450)
    new Vector(1600,450)
    new Vector(0,600)
    new Vector(400,600)
    new Vector(800,600)
    new Vector(1200,600)
    new Vector(1600,600)
    new Vector(0,750)
    new Vector(400,750)
    new Vector(800,750)
  ]

  #log attraction
  collision = new RigidCollision()

  #Render Code
  #Render springs
  #canvas = $('#canvas')[0]
  #canvas.width = Session.get('windowWidth')
  #canvas.height = Session.get('windowHeight')
  #ctx = canvas.getContext('2d')

  log 'Physics loop'

  #Tile Physics
  tileWrapperCount = 28
  for i in [0...tileWrapperCount]
    log 'Pushing particles'

    #Origin
    #origin = new Particle()
    #origin.moveTo(new Vector(400,200))

    #Particle
    particle = new Particle()
    particle.size = new Vector(400,150)
    #particle.mass = 40000
    #particle.behaviours.push new Wander 0.4
    #particle.behaviours.push jiffyLube[i]
    #particle.behaviours.push bounds
    particle.moveTo position[i]
    particle.behaviours.push collision
    #if particle.id is 'p1'
    #  particle.mass = 1000
    #  particle.pos.set()
    #particle.moveTo(position[i])
    #particle.behaviours.push new ConstantForce(new Vector(100,100))
      #particle.moveTo(new Vector(600,600))

    #Spring
    #spring = new Spring(origin,particle,100,1.0)
    collision.pool.push particle

    #physics.particles.push origin
    physics.particles.push particle
    #physics.springs.push spring