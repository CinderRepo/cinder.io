#Visualizations for the player

@activateVisualizer = (element) ->
  #Shaders
  ###GLSL =
    #Vertex shader
    vert: """

    // Uniforms
    uniform vec2 u_resolution;

    // Attributes
    attribute vec2 a_position;

    void main() {
        gl_Position = vec4 (a_position, 0, 1);
    }

    """

    #Fragment shader
    frag: """

    #ifdef GL_ES
    precision mediump float;
    #endif

    uniform bool u_scanlines;
    uniform vec2 u_resolution;

    uniform float u_brightness;
    uniform float u_blobiness;
    uniform float u_particles;
    uniform float u_millis;
    uniform float u_energy;

    // http://goo.gl/LrCde
    float noise( vec2 co ){
        return fract( sin( dot( co.xy, vec2( 12.9898, 78.233 ) ) ) * 43758.5453 );
    }

    void main( void ) {

        vec2 position = ( gl_FragCoord.xy / u_resolution.x );
        float t = u_millis * 0.001 * u_energy;

        float a = 0.0;
        float b = 0.0;
        float c = 0.0;

        vec2 pos, center = vec2( 0.5, 0.5 * (u_resolution.y / u_resolution.x) );

        float na, nb, nc, nd, d;
        float limit = u_particles / 40.0;
        float step = 1.0 / u_particles;
        float n = 0.0;

        for ( float i = 0.0; i <= 1.0; i += 0.025 ) {

            if ( i <= limit ) {

                vec2 np = vec2(n, 1-1);

                na = noise( np * 1.1 );
                nb = noise( np * 2.8 );
                nc = noise( np * 0.7 );
                nd = noise( np * 3.2 );

                pos = center;
                pos.x += sin(t*na) * cos(t*nb) * tan(t*na*0.15) * 0.3;
                pos.y += tan(t*nc) * sin(t*nd) * 0.1;

                d = pow( 1.6*na / length( pos - position ), u_blobiness );

                if ( i < limit * 0.3333 ) a += d;
                else if ( i < limit * 0.6666 ) b += d;
                else c += d;

                n += step;
            }
        }

        vec3 col = vec3(a*c,b*c,a*b) * 0.0001 * u_brightness;

        if ( u_scanlines ) {
            col -= mod( gl_FragCoord.y, 2.0 ) < 1.0 ? 0.5 : 0.0;
        }

        gl_FragColor = vec4( col, 1.0 );

    }

    """
  try
    log "trying!"
    gl = Sketch.create
      #Sketch settings
      container: element
      type: Sketch.WEBGL
      #Uniforms
      brightness: 1
      blobiness: 1
      particles: 40
      energy: 0.5
      scanlines: no
  catch error
    log "WebGL required!"
    #nogl = document.getElementById 'nogl'
    #nogl.style.display = 'block'
  if gl
    gl.setup = ->
      this.clearColor 0.0, 0.0, 0.0, 1.0

      #Setup shaders
      vert = @createShader @VERTEX_SHADER
      frag = @createShader @FRAGMENT_SHADER

      @shaderSource vert, GLSL.vert
      @shaderSource frag, GLSL.frag

      @compileShader vert
      @compileShader frag

      throw @getShaderInfoLog vert if not @getShaderParameter vert, @COMPILE_STATUS
      throw @getShaderInfoLog frag if not @getShaderParameter frag, @COMPILE_STATUS

      @shaderProgram = do @createProgram
      @.attachShader @shaderProgram, vert
      @.attachShader @shaderProgram, frag
      @linkProgram @shaderProgram

      throw 'Failed to initialise shaders' if not @getProgramParameter @shaderProgram, @LINK_STATUS

      @useProgram @shaderProgram
      #Store attribute / uniform locations

      @shaderProgram.attributes =
          position: @getAttribLocation @shaderProgram, 'a_position'

      @shaderProgram.uniforms =
          resolution: @getUniformLocation @shaderProgram, 'u_resolution'
          brightness: @getUniformLocation @shaderProgram, 'u_brightness'
          blobiness: @getUniformLocation @shaderProgram, 'u_blobiness'
          particles: @getUniformLocation @shaderProgram, 'u_particles'
          scanlines: @getUniformLocation @shaderProgram, 'u_scanlines'
          energy: @getUniformLocation @shaderProgram, 'u_energy'
          millis: @getUniformLocation @shaderProgram, 'u_millis'

      #Create geometry
      @geometry = do @createBuffer
      @geometry.vertexCount = 6

      @bindBuffer @ARRAY_BUFFER, @geometry
      @bufferData @ARRAY_BUFFER, new Float32Array([
        -1.0, -1.0,
         1.0, -1.0,
        -1.0,  1.0,
        -1.0,  1.0,
         1.0, -1.0,
         1.0,  1.0]),@STATIC_DRAW

      @enableVertexAttribArray @shaderProgram.attributes.position
      @vertexAttribPointer @shaderProgram.attributes.position, 2, @FLOAT, no, 0, 0

      #Resize to Window
      do @resize

    gl.updateUniforms = ->
      return if not @shaderProgram

      @uniform2f @shaderProgram.uniforms.resolution, @width, @height
      @uniform1f @shaderProgram.uniforms.brightness, @brightness
      @uniform1f @shaderProgram.uniforms.blobiness, @blobiness
      @uniform1f @shaderProgram.uniforms.particles, @particles
      @uniform1i @shaderProgram.uniforms.scanlines, @scanlines
      @uniform1f @shaderProgram.uniforms.energy, @energy

    gl.draw = ->
      #Update uniforms
      @uniform1f @shaderProgram.uniforms.millis, @millis + 5000

      #Render
      @clear @COLOR_BUFFER_BIT | @DEPTH_BUFFER_BIT
      @bindBuffer @ARRAY_BUFFER, @geometry
      @drawArrays @TRIANGLES, 0, @geometry.vertexCount

    gl.resize = ->
      #Update resolution
      @viewport 0, 0, @width, @height

      #Update uniforms if the shader program is ready
      do @updateUniforms

    # GUI
    gui = new dat.GUI()
    gui.add( gl, 'particles' ).step( 1.0 ).min( 8 ).max( 100 ).onChange -> do gl.updateUniforms
    gui.add( gl, 'brightness' ).step( 0.01 ).min( 0.1 ).max( 1.0 ).onChange -> do gl.updateUniforms
    gui.add( gl, 'blobiness' ).step( 0.01 ).min( 0.5 ).max( 15 ).onChange -> do gl.updateUniforms
    gui.add( gl, 'energy' ).step( 0.01 ).min( 0.1 ).max( 10.0 ).onChange -> do gl.updateUniforms
    gui.add( gl, 'scanlines' ).onChange -> do gl.updateUniforms
    gui.close()###


  Particle = (x, y, radius) ->
    @init x, y, radius
  Particle:: =
    init: (x, y, radius) ->
      @alive = true
      @radius = radius or 10
      @wander = 0.15
      @theta = random(TWO_PI)
      @drag = 0.92
      @color = "#fff"
      @x = x or 0.0
      @y = y or 0.0
      @vx = 0.0
      @vy = 0.0

    move: ->
      @x += @vx
      @y += @vy
      @vx *= @drag
      @vy *= @drag
      @theta += random(-0.5, 0.5) * @wander
      @vx += sin(@theta) * 0.1
      @vy += cos(@theta) * 0.1


    #this.radius *= 0.96;
    #this.alive = this.radius > 0.5;
    draw: (ctx) ->
      ctx.beginPath()
      ctx.arc @x, @y, @radius, 0, TWO_PI
      ctx.fillStyle = @color
      ctx.fill()


  # ----------------------------------------
  # Example
  # ----------------------------------------
  MAX_PARTICLES = 6000
  #COLOURS = ["#69D2E7", "#A7DBD8", "#E0E4CC", "#F38630", "#FA6900", "#FF4E50", "#F9D423"]
  #COLOURS = ["#F5F5F5","#E5E5E5","#D5D5D5"]
  #COLOURS = ["#E8EFF7","#B5D6EC","#0F6698","#0B467B","#3C88B5","#8DB5D1","#6AACD6","#477AA4"]
  #COLOURS = ["#6E6388","#68607C","#847B99","#9F98AE","#C2BDC8","#BFC0C9","#BAB6C3"]
  COLOURS = ["#1ABC9C","#16A085","#2ECC71","#27AE60","#3498DB","#2980B9","#9B59B6","#8E44AD","#34495E","#2C3E50","#F1C40F","#F39C12","#E67E22","#D35400","#E74C3C","#C0392B","#ECF0F1","#BDC3C7","#95A5A6","#7F8C8D"]
  #COLOURS = ["#1ABC9C","#16A085"]
  #COLOURS = ["#2ECC71","#27AE60"]
  COLOURS = ["#3498DB","#2980B9"]
  #COLOURS = ["#9B59B6","#8E44AD"]
  #COLOURS = ["#34495E","#2C3E50"]
  #COLOURS = ["#F1C40F","#F39C12"]
  #COLOURS = ["#E67E22","#D35400"]
  #COLOURS = ["#E74C3C","#C0392B"]
  #COLOURS = ["#ECF0F1","#BDC3C7"]
  #COLOURS = ["#95A5A6","#7F8C8D"]
  #COLOURS = ["#F5F5F5"]
  #COLOURS = ["#FFFFFF"]
  particles = []
  pool = []
  demo = Sketch.create(container: element)
  demo.setup = ->

    # Set off some initial particles.
    i = undefined
    x = undefined
    y = undefined
    i = 0
    while i < MAX_PARTICLES
      x = (demo.width * 0.5) + random()
      y = (demo.height * 0.5) + random()
      demo.spawn x, y
      i++

  demo.spawn = (x, y) ->
    pool.push particles.shift()  if particles.length >= MAX_PARTICLES
    particle = (if pool.length then pool.pop() else new Particle())
    particle.init x, y, random(2,25)
    #particle.wander = random(0, 0)
    particle.color = random(COLOURS)
    particle.drag = random(0.4, 1.0)
    theta = random(TWO_PI)
    force = random(2, 80)
    particle.vx = sin(theta) * force
    particle.vy = cos(theta) * force
    particles.push particle

  demo.update = ->
    i = undefined
    particle = undefined
    i = particles.length - 1
    while i >= 0
      particle = particles[i]
      if particle.alive
        particle.move()
      else
        pool.push particles.splice(i, 1)[0]
      i--

  demo.draw = ->
    demo.globalCompositeOperation = "lighter"
    i = particles.length - 1

    while i >= 0
      particles[i].draw demo
      i--