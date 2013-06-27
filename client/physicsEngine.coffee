###BASE###
#Allows safe, dyamic creation of namespaces.
namespace = (id) ->
  root = self
  root = root[path] ?= {} for path in id.split '.'

#RequestAnimationFrame shim.
do ->
  time = 0
  vendors = ['ms', 'moz', 'webkit', 'o']
  for vendor in vendors when not window.requestAnimationFrame
    window.requestAnimationFrame = window[ vendor + 'RequestAnimationFrame']
    window.cancelAnimationFrame = window[ vendor + 'CancelAnimationFrame']
  if not window.requestAnimationFrame
    window.requestAnimationFrame = (callback, element) ->
      now = new Date().getTime()
      delta = Math.max 0, 16 - (now - old)
      setTimeout (-> callback(time + delta)), delta
      old = now + delta
  if not window.cancelAnimationFrame
    window.cancelAnimationFrame = (id) ->
      clearTimeout id

###MATH - RANDOM - We call it Randall to avoid global conflicts with Meteor###
@Randall = (min, max) ->
  if not max?
    max = min
    min = 0
  min + Math.random() * (max - min)
@Randall.int = (min, max) ->
  if not max?
    max = min
    min = 0
  Math.floor min + Math.random() * (max - min)
@Randall.sign = (prob = 0.5) ->
  if do Math.random < prob then 1 else -1
@Randall.bool = (prob = 0.5) ->
  do Math.random < prob
@Randall.item = (list) ->
  list[ Math.floor Math.random() * list.length ]

###MATH - VECTOR###
class @Vector
  #Adds two vectors and returns the product.
  @add: (v1, v2) ->
    new Vector v1.x + v2.x, v1.y + v2.y
  #Subtracts v2 from v1 and returns the product.
  @sub: (v1, v2) ->
    new Vector v1.x - v2.x, v1.y - v2.y
  #Projects one vector (v1) onto another (v2)
  @project: (v1, v2) ->
    v1.clone().scale ((v1.dot v2) / v1.magSq())
  #Creates a new Vector instance.
  constructor: (@x = 0.0, @y = 0.0, @z = 0.0) ->
  #Sets the components of this vector.
  set: (@x, @y, @z) ->
    @
  #Add a vector to this one.
  add: (v) ->
    @x += v.x; @y += v.y; @z += v.z; @
  #Subtracts a vector from this one.
  sub: (v) ->
    @x -= v.x; @y -= v.y; @z -= v.z; @
  #Scales this vector by a value.
  scale: (f) ->
    @x *= f; @y *= f; @z *= f; @
  #Computes the dot product between vectors.
  dot: (v) ->
    @x * v.x + @y * v.y + @z * v.z
  #Computes the cross product between vectors.
  cross: (v) ->
    (@x * v.y) - (@y * v.x) - (@z * v.z)
  #Computes the magnitude (length).
  mag: ->
    Math.sqrt @x*@x + @y*@y + @z*@z
  #Computes the squared magnitude (length).
  magSq: ->
    @x*@x + @y*@y + @z*@z
  #Computes the distance to another vector.
  dist: (v) ->
    dx = v.x - @x; dy = v.y - @y; dz = v.z - @z
    Math.sqrt dx*dx + dy*dy + dz*dz
  #Computes the squared distance to another vector.
  distSq: (v) ->
    dx = v.x - @x; dy = v.y - @y; dz = v.z - @z
    dx*dx + dy*dy + dz*dz
  #Normalises the vector, making it a unit vector (of length 1).
  norm: ->
    m = Math.sqrt @x*@x + @y*@y + @z*@z
    @x /= m
    @y /= m
    @z /= m
    @
  #Limits the vector length to a given amount.
  limit: (l) ->
    mSq = @x*@x + @y*@y + @z*@z
    if mSq > l*l
      m = Math.sqrt mSq
      @x /= m; @y /= m; @z /= m
      @x *= l; @y *= l; @z *= l
      @
  #Copies components from another vector.
  copy: (v) ->
    @x = v.x; @y = v.y; @z = v.z; @
  #Clones this vector to a new itentical one.
  clone: ->
    new Vector @x, @y, @z
  #Resets the vector to zero.
  clear: ->
    @x = 0.0; @y = 0.0; @z = 0.0; @

###INTEGRATOR###
class @Integrator
  integrate: (particles, dt) ->
    #Override.

###INTEGRATOR - EULER###
class @Euler extends Integrator
  #v += a * dt
  #x += v * dt
  integrate: (particles, dt, drag) ->
    vel = new Vector()
    for p in particles when not p.fixed
      #Store previous location.
      p.old.pos.copy p.pos
      #Scale force to mass.
      p.acc.scale p.massInv
      #Duplicate velocity to preserve momentum.
      vel.copy p.vel
      #Add force to velocity.
      p.vel.add p.acc.scale dt
      #Add velocity to position.
      p.pos.add vel.scale dt
      #Apply friction.
      if drag then p.vel.scale drag
      #Reset forces.
      p.acc.clear()

###INTEGRATOR - IMPROVED EULER###
class @ImprovedEuler extends Integrator
  #x += (v * dt) + (a * 0.5 * dt * dt)
  #v += a * dt
  integrate: (particles, dt, drag) ->
    acc = new Vector()
    vel = new Vector()
    dtSq = dt * dt
    for p in particles when not p.fixed
      #Store previous location.
      p.old.pos.copy p.pos
      #Scale force to mass.
      p.acc.scale p.massInv
      #Duplicate velocity to preserve momentum.
      vel.copy p.vel
      #Duplicate force.
      acc.copy p.acc
      #Update position.
      p.pos.add (vel.scale dt).add (acc.scale 0.5 * dtSq)
      #Update velocity.
      p.vel.add p.acc.scale dt
      #Apply friction.
      if drag then p.vel.scale drag
      #Reset forces.
      p.acc.clear()

###INTEGRATOR - VELOCITY VERLET###
class @Verlet extends Integrator
  #v = x - ox
  #x = x + (v + a * dt * dt)
  integrate: (particles, dt, drag) ->
    pos = new Vector()
    dtSq = dt * dt
    for p in particles when not p.fixed
      #Scale force to mass.
      p.acc.scale p.massInv
      #Derive velocity.
      (p.vel.copy p.pos).sub p.old.pos
      #Apply friction.
      if drag then p.vel.scale drag
      #Apply forces to new position.
      (pos.copy p.pos).add (p.vel.add p.acc.scale dtSq)
      #Store old position.
      p.old.pos.copy p.pos
      #update position.
      p.pos.copy pos
      #Reset forces.
      p.acc.clear()

###ENGINE - PHYSICS###
class @Physics
  constructor: (@integrator = new Euler()) ->
    #Fixed timestep.
    @timestep = 1.0 / 60
    #Friction within the system.
    @viscosity = 0.005
    #Global behaviours.
    @behaviours = []
    #Time in seconds.
    @_time = 0.0
    #Last step duration.
    @_step = 0.0
    #Current time.
    @_clock = null
    #Time buffer.
    @_buffer = 0.0
    #Max iterations per step.
    @_maxSteps = 4
    #Particles in system.
    @particles = []
    #Springs in system.
    @springs = []
  #Performs a numerical integration step.
  integrate: (dt) ->
    #Drag is inversely proportional to viscosity.
    drag = 1.0 - @viscosity
    #Update particles / apply behaviours.
    for particle, index in @particles
      for behaviour in @behaviours
        behaviour.apply particle, dt, index
      particle.update dt, index
    #Integrate motion.
    @integrator.integrate @particles, dt, drag
    #Compute all springs.
    for spring in @springs
      spring.apply()
  #Steps the system.
  step: ->
    #Initialise the clock on first step.
    @_clock ?= new Date().getTime()
    #Compute delta time since last step.
    time = new Date().getTime()
    delta = time - @_clock
    #No sufficient change.
    return if delta <= 0.0
    #Convert time to seconds.
    delta *= 0.001
    #Update the clock.
    @_clock = time
    #Increment time buffer.
    @_buffer += delta
    #Integrate until the buffer is empty or until the
    #maximum amount of iterations per step is reached.
    i = 0
    while @_buffer >= @timestep and ++i < @_maxSteps
      #Integrate motion by fixed timestep.
      @integrate @timestep
      #Reduce buffer by one timestep.
      @_buffer -= @timestep
      #Increment running time.
      @_time += @timestep
    #Store step time for debugging.
    @_step = new Date().getTime() - time
  #Clean up after yourself.
  destroy: ->
    @integrator = null
    @particles = null
    @springs = null

###ENGINE - SPRING###
class @Spring
  constructor: (@p1, @p2, @restLength = 100, @stiffness = 1.0) ->
    @_delta = new Vector()
  #F = -kx
  apply: ->
    (@_delta.copy @p2.pos).sub @p1.pos
    #log (@_delta.copy @p2.pos).sub @p1.pos
    dist = @_delta.mag() + 0.000001
    force = (dist - @restLength) / (dist * (@p1.massInv + @p2.massInv)) * @stiffness
    if not @p1.fixed
      @p1.pos.add (@_delta.clone().scale force * @p1.massInv)
    if not @p2.fixed
      @p2.pos.add (@_delta.scale -force * @p2.massInv)

###ENGINE - PARTICLE###
class @Particle
  @GUID = 0
  constructor: (@mass = 1.0) ->
    #Set a unique id.
    @id = 'p' + Particle.GUID++
    #Set initial mass.
    @setMass @mass
    #Set initial radius.
    @setRadius 1.0
    #Apply forces.
    @fixed = false
    #Behaviours to be applied.
    @behaviours = []
    #Current position.
    @pos = new Vector()
    #Current size.
    @size = new Vector()
    #Current velocity.
    @vel = new Vector()
    #Current force.
    @acc = new Vector()
    #Previous state.
    @old =
      pos: new Vector()
      size: new Vector()
      vel: new Vector()
      acc: new Vector()
  #Moves the particle to a given location vector.
  moveTo: (pos) ->
    @pos.copy pos
    @old.pos.copy pos
  #Sets the mass of the particle.
  setMass: (@mass = 1.0) ->
    #The inverse mass.
    @massInv = 1.0 / @mass
  #Sets the radius of the particle.
  setRadius: (@radius = 1.0) ->
    @radiusSq = @radius * @radius
  #Applies all behaviours to derive new force.
  update: (dt, index) ->
    #Apply all behaviours.
    if not @fixed
      for behaviour in @behaviours
        behaviour.apply @, dt, index

###BEHAVIOUR###
class @Behaviour
  #Each behaviour has a unique id
  @GUID = 0
  constructor: ->
    @GUID = Behaviour.GUID++
    @interval = 1
    ##console.log @, @GUID
  apply: (p, dt, index) ->
    #Store some data in each particle.
    (p['__behaviour' + @GUID] ?= {counter: 0}).counter++

###BEHAVIOUR - ATTRACTION###
class @Attraction extends Behaviour
  constructor: (@target = new Vector(), @radius = 1000, @strength = 100.0) ->
    @_delta = new Vector()
    @setRadius @radius
    super
  #Sets the effective radius of the bahaviour.
  setRadius: (radius) ->
    @radius = radius
    @radiusSq = radius * radius
  apply: (p, dt, index) ->
    #super p, dt, index
    #Vector pointing from particle to target.
    (@_delta.copy @target).sub p.pos
    #Squared distance to target.
    distSq = @_delta.magSq()
    #Limit force to behaviour radius.
    if distSq < @radiusSq and distSq > 0.000001
      #Calculate force vector.
      @_delta.norm().scale (1.0 - distSq / @radiusSq)
      #Apply force.
      #log @strength
      #log @_delta.norm().scale
      #log p.acc
      p.acc.add @_delta.scale @strength

###BEHAVIOUR - JiffyLube###
class @JiffyLube extends Behaviour
  constructor: (@target = new Vector(), @radius = 1000, @strength = 100.0) ->
    @_delta = new Vector()
    @setRadius @radius
    super
  #Sets the effective radius of the bahaviour.
  setRadius: (radius) ->
    @radius = radius
    @radiusSq = radius * radius
  apply: (p, dt, index) ->
    #super p, dt, index
    #Vector pointing from particle to target.
    (@_delta.copy @target).sub p.pos
    #Squared distance to target.
    distSq = @_delta.magSq()
    #Limit force to behaviour radius.
    if distSq < @radiusSq and distSq > 0.000001
      #Calculate force vector.
      @_delta.norm().scale (1.0 - distSq / @radiusSq)
      #Apply force.
      #log @strength
      #log @_delta.norm().scale
      #log p.acc
      p.acc.add @_delta.scale @strength

###BEHAVIOUR - MAGNET###
class @Magnet extends Behaviour
  constructor: (@target = new Vector(), @radius = 1000, @strength = 100.0) ->
    #log 'Magnet'
    @_delta = new Vector()
    @setRadius @radius
    super
  setRadius: (radius) ->
    @radius = radius
    @radiusSq = radius * radius
  apply: (p, dt, index) ->
    #if p.id is 'p1' or p.id is 'p2' or p.id is 'p3' or p.id is 'p4' or p.id is 'p5'
    (@_delta.copy @target).sub p.pos
    distX = p.pos.x - @target.x
    distY = p.pos.y - @target.y
    if distY >= -10 and distY <= 0
      p.acc.clear()
      p.vel.clear()
      p.pos.y = @target.y
    else
      p.acc.add(@_delta.norm().scale(@strength))

    if distX >= -10 and distX <= 0
      p.acc.clear()
      #p.acc.sub(p.acc.scale(.10))
      p.vel.clear()
      p.pos.x = @target.x
    else
      p.acc.add(@_delta.norm().scale(@strength))

    #if p.id is 'p1'
      #Vector pointing from particle to target.
    #(@_delta.copy @target).sub p.pos
      #log (@_delta.copy @target).sub p.pos
      #log p.pos
      #log @target
      #Squared distance to target.
      #log @_delta.x
    #distSq = @_delta.magSq()
    #log p.vel.x
      #log distSq
      #log @radiusSq
      #Limit force to behaviour radius.
    #if distSq < @radiusSq and distSq > 100
        #log 'True'
        #log 'True ' + distSq
        #Calculate force vector.
        #@_delta.norm().scale (1.0 - distSq / @radiusSq)
        #log p.pos
        #log @target
        #Apply force
        #log @_delta
      #p.acc.add(new Vector(1000,0))
      #p.acc.add @_delta.scale @strength
        #log p.acc
        #p.acc.add(@_delta.norm().add(new Vector(10,10)))
    #else
      #p.vel.clear()
      #p.acc.clear()
        #log 'False ' + p.acc.x
        #p.acc.clear()
        #p.acc.sub(new Vector(100,0))
        #log 'Else ' + distSq
        #p.acc.clear()

###BEHAVIOUR - COLLISION###
#TODO: Collision response for non Verlet integrators.
class @Collision extends Behaviour
  constructor: (@useMass = yes, @callback = null) ->
    #Pool of collidable particles.
    @pool = []
    #Delta between particle positions.
    @_delta = new Vector()
    super
  apply: (p, dt, index) ->
    #log 'p'
    #log p
    #log 'dt'
    #log dt
    #log 'index'
    #log index
    #super p, dt, index
    #Check pool for collisions.
    for o in @pool[index..] when o isnt p
      #Delta between particles positions.
      (@_delta.copy o.pos).sub p.pos
      #Squared distance between particles.
      distSq = @_delta.magSq()
      #Sum of both radii.
      radii = p.radius + o.radius
      #Check if particles collide.
      if distSq <= radii * radii
        log 'Collided!'
        #Compute real distance.
        dist = Math.sqrt distSq
        #Determine overlap.
        overlap = (p.radius + o.radius) - dist
        overlap += 0.5
        #Total mass.
        mt = p.mass + o.mass
        #Distribute collision responses.
        r1 = if @useMass then o.mass / mt else 0.5
        r2 = if @useMass then p.mass / mt else 0.5
        #Move particles so they no longer overlap.
        p.pos.add (@_delta.clone().norm().scale overlap * -r1)
        o.pos.add (@_delta.norm().scale overlap * r2)
        #Fire callback if defined.
        @callback?(p, o, overlap)

###BEHAVIOUR - RIGID COLLISION###
class @RigidCollision extends Behaviour
  constructor: (@useMass = yes, @callback = null) ->
    #Pool of collidable particles.
    @pool = []
    #Delta between particle positions.
    @_delta = new Vector()
    super
  apply: (p, dt, index) ->
    #log 'p'
    #log p
    #log 'dt'
    #log dt
    #log 'index'
    #log index
    #super p, dt, index
    #log p.size.x
    #log p.size.y
    #Check pool for collisions.
    for o in @pool[index..] when o isnt p
      (@_delta.copy o.pos).sub p.pos
      #log 'p'
      #log p
      #log 'o'
      #log o
      boundsX = p.pos.x + p.size.x
      boundsY = p.pos.y + p.size.y
      #log 'colliderTestingEntity'
      #log p.id
      #log boundsX
      #log boundsY
      #log 'entityBeingTestedAgainst'
      #log o.id
      #log o.pos.x
      #log o.pos.y
      if boundsX > o.pos.x and boundsY > o.pos.y
        log 'Colliding'
        overlapX = boundsX - o.pos.x
        overlapY = boundsY - o.pos.y
        #log overlapY
        #p.pos.add (@_delta.clone().norm().scale overlapY)
        #o.pos.add (@_delta.norm().scale overlapY)
        #p.pos.sub new Vector(100,100)
        #o.pos.sub new Vector(200,200)
        #log p.id
        #log o.id
        #log 'boundsX collided!'
        #debugger
      #if boundsY > o.pos.y
      #  log 'boundsY collided!'
      #debugger
      #log '=========================='
      #log 'p.id     ' + p.id
      #log 'p.size.x ' + p.size.x
      #log 'p.size.y ' + p.size.y
      #log 'p.pos.x  ' + p.pos.x
      #log 'p.pos.y  ' + p.pos.y
      #debugger

###BEHAVIOUR - CONSTANT FORCE###
class @ConstantForce extends Behaviour
  constructor: (@force = new Vector()) ->
    super
  apply: (p, dt,index) ->
    #super p, dt, index
    p.acc.add @force

###BEHAVIOUR - EDGE BOUNCE###
class @EdgeBounce extends Behaviour
  constructor: (@min = new Vector(), @max = new Vector()) ->
    super
  apply: (p, dt, index) ->
    #log @min
    #log @max
    #super p, dt, index
    ###if p.pos.x - p.radius < @min.x
      p.pos.x = @min.x + p.radius
    else if p.pos.x + p.radius > @max.x
      p.pos.x = @max.x - p.radius
    if p.pos.y - p.radius < @min.y
      p.pos.y = @min.y + p.radius
    else if p.pos.y + p.radius > @max.y
      p.pos.y = @max.y - p.radius###
    if p.pos.z + p.radius < @min.z
      log 'EXITING ZDEPTH MIN BOUNDS'
      #log 'p.pos.z: ' + p.pos.z
      #log '@min.z: ' + @min.z
      #p.acc.clear()
      #p.vel.clear()
      p.pos.z = @min.z
      #diff = p.pos.z - @min.z
      #p.pos.z = p.pos.z
    else if p.pos.z - p.radius > @max.z
      log 'EXITING ZDEPTH MAX BOUNDS'
      #log 'p.pos.z: ' + p.pos.z
      #log '@max.z: ' + @max.z
      #p.acc.clear()
      #p.vel.clear()
      #p.pos.z = @max.z
      #Get the position difference
      #diff = p.pos.z - @max.z
      #p.pos.z = p.pos.z

###BEHAVIOUR - EDGE WRAP###
class @EdgeWrap extends Behaviour
  constructor: (@min = new Vector(), @max = new Vector()) ->
    super
  apply: (p, dt, index) ->
    #super p, dt, index
    #log p.width
    #log p.height
    #log p.borderRadius
    if p.pos.x + p.width < @min.x
      p.pos.x = @max.x + p.width
      p.old.pos.x = p.pos.x
    if p.pos.x - p.width > @max.x
      p.pos.x = @min.x - p.width
      p.old.pos.x = p.pos.x
    if p.pos.y + p.height < @min.y
      p.pos.y = @max.y + p.height
      p.old.pos.y = p.pos.y
    if p.pos.y - p.height > @max.y
      p.pos.y = @min.y - p.height
      p.old.pos.y = p.pos.y

    ###if p.pos.x + p.radius < @min.x
      p.pos.x = @max.x + p.radius
      p.old.pos.x = p.pos.x
    else if p.pos.x - p.radius > @max.x
      p.pos.x = @min.x - p.radius
      p.old.pos.x = p.pos.x
    if p.pos.y + p.radius < @min.y
      p.pos.y = @max.y + p.radius
      p.old.pos.y = p.pos.y
    else if p.pos.y - p.radius > @max.y
      p.pos.y = @min.y - p.radius
      p.old.pos.y = p.pos.y###

###BEHAVIOUR - WANDER###
class @Wander extends Behaviour
  constructor: (@jitter = 0.5, @radius = 100, @strength = 1.0) ->
    @theta = Math.random() * Math.PI * 2
    super
  apply: (p, dt, index) ->
    #super p, dt, index
    @theta += (Math.random() - 0.5) * @jitter * Math.PI * 2
    p.acc.x += Math.cos(@theta) * @radius * @strength
    p.acc.y += Math.sin(@theta) * @radius * @strength