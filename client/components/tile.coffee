Template.tile.view = ()->
	state: 'view'
	message: 'View'
Template.tile.revealedDown = ->
	if Session.equals('activeTile',this._id) then 'active' else ''
Template.tile.events
	'click .tile':(e,t)->
		log 'CLICKED TILE'
		transitionProp = getStyleProperty('transition')
		transitionEndEvent =
			WebkitTransition: 'webkitTransitionEnd'
			MozTransition: 'transitionend'
			OTransition: 'otransitionend'
			transition: 'transitionend'
		[{transitionProp}]

		currentTarget = e.currentTarget
		previousContentSize = getSize(currentTarget)

		#Disable transitions
		currentTarget.style[transitionProp] = 'none'

		# set current size 
		currentTarget.style.width = previousContentSize.width + 'px'
		currentTarget.style.height = previousContentSize.height + 'px'
		
		itemElem = currentTarget.parentNode
		isExpanded = itemElem.classList.contains('expanded')
		if isExpanded
			itemElem.classList.remove('expanded')
		else
			$('.tileWrapper').removeClass('expanded')
			itemElem.classList.add('expanded')

		# force redraw
		redraw = currentTarget.offsetWidth

		# renable default transition
		currentTarget.style[transitionProp] = ''

		#Reset 100%/100% sizing after transition end
		if transitionProp
			log 'Hello?'
			log transitionProp
			onTransitionEnd = ->
				log 'This isn\'t firing, is it?'
				currentTarget.style.width = ''
				currentTarget.style.height = ''
				currentTarget.removeEventListener('webkitTransitionEnd', onTransitionEnd, false)
			log 'TransitionEnd?'
			currentTarget.addEventListener('webkitTransitionEnd', onTransitionEnd, false)

		#Set new size
		log 'itemElem'
		log itemElem
		size = getSize(itemElem)
		currentTarget.style.width = size.width + 'px'
		currentTarget.style.height = size.height + 'px'
		if isExpanded
			grid.layout()
		else
			grid.fit itemElem
	'click .button':(e,t)->
		log 'TILE BUTTON CLICKED!'
		e.stopImmediatePropagation()

		#if tileWrapper.hasClass('expanded')
		#	log 'FIT'
		#	tileWrapper.removeClass('expanded')
			#grid.fit(tileWrapper)
		#else
		#	log 'LAYOUT'
		#	$('.tileWrapper').removeClass('expanded')
		#	tileWrapper.addClass('expanded')
			#grid.layout()

		#isExpanded = tileWrapper.hasClass('expanded')
		#log 'isExpanded: ' + isExpanded
		#if isExpanded
		#	log 'isExpanded should be true'
		#	grid.fit currentTarget
		#else
		#	log 'isExpanded should be false'
		#	grid.layout()
	###'webkitTransitionEnd .tileWrapper,
	 transitionend .tileWrapper,
	 otransitionend .tileWrapper,':(e,t)->
	 	log 'TRANSITION ENDED'
	 	currentTarget = t.find('.tile')
	 	currentTarget.style.width = ''
	 	currentTarget.style.height = ''###
Template.tile.preserve({
	'.tileWrapper'
	'.tile'
})