Template.contentViewer.preview = ()->
	state: 'preview'
	message: 'p'

Template.contentViewer.play = ()->
	state: 'play'
	message: 'Play'

Template.contentViewer.view = ()->
	state: 'view'
	message: 'View'

Template.contentViewer.state = ()->
	#Session.get('activeContentPane')

Template.contentViewer.isOwner = (owner) ->
    Meteor.user() and Meteor.user().username is owner

Template.contentViewer.events 
	'change .uploadGame':(e,t)->
		Meteor.saveGame e.srcElement.files[0], @_id
	'click .fullscreen':(e,t)->
		log 'CLICKED'
		currentTarget = e.currentTarget
		log currentTarget
		contentViewerSlider = e.currentTarget.parentElement.getElementsByClassName('contentViewerSlider')[0]
		log contentViewerSlider

		if currentTarget.classList.contains('active')
			currentTarget.classList.remove('active')
			document.webkitExitFullscreen()
			#contentViewer.mozRequestFullScreen()
			#contentViewer.requestFullscreen()
		else
			currentTarget.classList.add('active')
			contentViewerSlider.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT)
			#document.mozCancelFullscreen()
			#document.exitFullscreen()
	'click .button':(e,t)->
		state = $(e.currentTarget).data('state')
		log 'Button State: ' + state
		#switch state
		#	when 'view'
		#		log this
		#		#Session.set('activePane','profile')
		#		#Session.set('oldProfilePosition',Session.get('profilePosition'))
		#		#Session.set('profilePosition',0)
		#	when 'preview'
		#		#Session.set('activeContentPane',state)
		#	when 'play'
		#		#Session.set('activeContentPane',state)
		#	else
		#		log 'Button State not accounted for.'

Template.contentViewer.preserve({
	'.contentViewer'
})
