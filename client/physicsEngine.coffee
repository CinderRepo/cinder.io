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

###MATH - RANDOM###
Random = (min, max) ->
  if not max?
    max = min
    min = 0
  min + Math.random() * (max - min)
Random.int = (min, max) ->
  if not max?
    max = min
    min = 0
  Math.floor min + Math.random() * (max - min)
Random.sign = (prob = 0.5) ->
  if do Math.random < prob then 1 else -1
Random.bool = (prob = 0.5) ->
  do Math.random < prob
Random.item = (list) ->
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
  constructor: (@x = 0.0, @y = 0.0) ->
  #Sets the components of this vector.
  set: (@x, @y) ->
    @
  #Add a vector to this one.
  add: (v) ->
    @x += v.x; @y += v.y; @
  #Subtracts a vector from this one.
  sub: (v) ->
    @x -= v.x; @y -= v.y; @
  #Scales this vector by a value.
  scale: (f) ->
    @x *= f; @y *= f; @
  #Computes the dot product between vectors.
  dot: (v) ->
    @x * v.x + @y * v.y
  #Computes the cross product between vectors.
  cross: (v) ->
    (@x * v.y) - (@y * v.x)
  #Computes the magnitude (length).
  mag: ->
    Math.sqrt @x*@x + @y*@y
  #Computes the squared magnitude (length).
  magSq: ->
    @x*@x + @y*@y
  #Computes the distance to another vector.
  dist: (v) ->
    dx = v.x - @x; dy = v.y - @y
    Math.sqrt dx*dx + dy*dy
  #Computes the squared distance to another vector.
  distSq: (v) ->
    dx = v.x - @x; dy = v.y - @y
    dx*dx + dy*dy
  #Normalises the vector, making it a unit vector (of length 1).
  norm: ->
    m = Math.sqrt @x*@x + @y*@y
    @x /= m
    @y /= m
    @
  #Limits the vector length to a given amount.
  limit: (l) ->
    mSq = @x*@x + @y*@y
    if mSq > l*l
      m = Math.sqrt mSq
      @x /= m; @y /= m
      @x *= l; @y *= l
      @
  #Copies components from another vector.
  copy: (v) ->
    @x = v.x; @y = v.y; @
  #Clones this vector to a new itentical one.
  clone: ->
    new Vector @x, @y
  #Resets the vector to zero.
  clear: ->
    @x = 0.0; @y = 0.0; @

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
    #Current velocity.
    @vel = new Vector()
    #Current force.
    @acc = new Vector()
    #Previous state.
    @old =
      pos: new Vector()
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
      p.acc.add @_delta.scale @strength

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
    #super p, dt, index
    if p.pos.x - p.radius < @min.x
      p.pos.x = @min.x + p.radius
    else if p.pos.x + p.radius > @max.x
      p.pos.x = @max.x - p.radius
    if p.pos.y - p.radius < @min.y
      p.pos.y = @min.y + p.radius
    else if p.pos.y + p.radius > @max.y
      p.pos.y = @max.y - p.radius

###BEHAVIOUR - EDGE WRAP###
class @EdgeWrap extends Behaviour
  constructor: (@min = new Vector(), @max = new Vector()) ->
    super
  apply: (p, dt, index) ->
    #super p, dt, index
    if p.pos.x + p.radius < @min.x
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
      p.old.pos.y = p.pos.y

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