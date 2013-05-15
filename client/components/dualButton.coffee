Template.dualButton.activeDualButtonLeft = ->
	log 'Checking active'
	#if Session.equals('activeDualButtonLeft',this._buttonLeftId) or Session.equals('activePane',this._buttonLeftState) then 'active' else ''

Template.dualButton.activeDualButtonRight = ->
	#if Session.equals('activeDualButtonRight',this._buttonRightId) or Session.equals('activePane',this._buttonRightState)  then 'active' else ''

Template.dualButton.events
	'click .dualButton': (e,t) ->
		log 'DualButton Clicked.'
		e.stopImmediatePropagation()
		state = $(e.currentTarget).data('state')
		Session.set('modalState',state)

Template.dualButton.preserve({
	'.dualButtonWrapper'
	'.dualButton.left'
	'.dualButtonMiddle'
	'.dualButton.right'
})

toggleProfile = () ->
	Session.set('activePane','profile')
	Session.set('profileContext','userProfile')
	if !Session.equals('profilePosition',0)
		Session.set('oldProfilePosition',Session.get('profilePosition'))
	Session.set('profilePosition',0)
toggleBrowse = () ->
	Session.set('activePane','browse')
	Session.set('profileContext','games')
	Session.set('activeContentPane','preview')
	Session.set('profilePosition',Session.get('oldProfilePosition'))
