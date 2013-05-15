Template.tile.view = ()->
	state: 'view'
	message: '>'
	_id: this._id
Template.tile.play = () ->
	state: 'play'
	message: 'Play'
	_id: this._id
Template.tile.expanded = ->
	if Session.equals('activeTile',this._id) and Session.equals('appState','preview') then 'preview' else if Session.equals('activeTile',this._id) and Session.equals('appState','view') then 'preview' else if Session.equals('activeTile',this._id) and Session.equals('appState','play') then 'preview' else ''
Template.tile.state = ->
	if Session.equals('activeTile',this._id) and Session.equals('appState','view') then 'expanded' else if Session.equals('appState','view') then 'hidden' else if Session.equals('activeTile',this._id) and Session.equals('appState','play') then 'hidden' else if Session.equals('appState','play') then 'hidden' else 'collapsed'
Template.tile.viewing = ->
	if Session.equals('activeTile',this._id) and Session.equals('appState','view') then Games.findOne({_id:Session.get('activeTile')},{}) else if Session.equals('activeTile',this._id) and Session.equals('appState','play') then Games.findOne({_id:Session.get('activeTile')},{}) else return
Template.tile.revealedDown = ->
	#if Session.equals('activeTile',this._id) then 'active' else ''
Template.tile.events
	'click .tile':(e,t)->
		log 'CLICKED TILE'
		if Session.equals('activeTile',this._id) and Session.equals('appState','preview')
			#If the appState is set to preview, switch it to browse.
			Session.set('activeTile',null)
			Session.set('appState','browse')
		else
			#If the appState is set to browse, switch it to preview.
			Session.set('activeTile',this._id)
			unless Session.equals('appState','view')
				Session.set('appState','preview')
Template.tile.preserve({
	'.tileWrapper'
	'.tile'
})

@toggleTile = (currentTarget,id) ->
	if currentTarget
		log currentTarget
		transitionProp = getStyleProperty('transition')
		transitionEndEvent =
			WebkitTransition: 'webkitTransitionEnd'
			MozTransition: 'transitionend'
			OTransition: 'otransitionend'
			transition: 'transitionend'
		[{transitionProp}]

		previousContentSize = getSize(currentTarget)

		#Disable transitions
		currentTarget.style[transitionProp] = 'none'

		# set current size 
		currentTarget.style.width = previousContentSize.width + 'px'
		currentTarget.style.height = previousContentSize.height + 'px'
		
		itemElem = currentTarget.parentNode
		isExpanded = itemElem.classList.contains('expanded')
		if isExpanded and Session.equals('appState',null) and Session.equals('activeTile',null)
			#Meteor.Router.to('/')
			log 'Removing stuff..?'
			$('.tileWrapper').removeClass('expanded')
			itemElem.classList.remove('expanded')
			#Session.set('activeTile',null)
		else
			#Meteor.Router.to('/' + this._id)
			$('.tileWrapper').removeClass('expanded')
			itemElem.classList.add('expanded')
			#Session.set('activeTile',id)

		# force redraw
		redraw = currentTarget.offsetWidth

		# renable default transition
		currentTarget.style[transitionProp] = ''

		#Reset 100%/100% sizing after transition end
		if transitionProp
			#log 'Hello?'
			#log transitionProp
			onTransitionEnd = ->
				#log 'This isn\'t firing, is it?'
				currentTarget.style.width = ''
				currentTarget.style.height = ''
				currentTarget.removeEventListener('webkitTransitionEnd', onTransitionEnd, false)
			#log 'TransitionEnd?'
			currentTarget.addEventListener('webkitTransitionEnd', onTransitionEnd, false)

		#Set new size
		#log 'itemElem'
		#log itemElem
		size = getSize(itemElem)
		currentTarget.style.width = size.width + 'px'
		currentTarget.style.height = size.height + 'px'
		if isExpanded
			grid.layout()
		else
			grid.fit itemElem