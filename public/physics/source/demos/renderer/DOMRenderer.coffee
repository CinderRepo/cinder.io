### DOM Renderer ###
class DOMRenderer extends Renderer
	constructor: ->
		super
		@useGPU = yes
		@domElement = document.createElement 'div'
	init: (physics) ->
		super physics
		# Set up particle DOM elements
		for p in physics.particles
			el = document.createElement 'span'
			el.className = 'fuck'
			st = el.style
			st.position = 'absolute'
			st.height = 150
			st.width = 400
			@domElement.appendChild el
			p.domElement = el
	render: (physics) ->
		super physics
		time = new Date().getTime()
		if @renderParticles
			for p in physics.particles
				if @useGPU
					p.domElement.style.WebkitTransform = """matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, #{p.pos.x|0}, #{p.pos.y|0}, 0, 1)"""
				else
					p.domElement.style.left = p.pos.x
					p.domElement.style.top = p.pos.y
		@renderTime = new Date().getTime() - time
	setSize: (@width, @height) =>
        super @width, @height
    destroy: ->
    	while @domElement.hasChildNodes()
    		@domElement.removeChild @domElement.lastChild