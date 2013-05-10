Template.dualButton.activeDualButtonLeft = ->
	log 'Checking active'
	if Session.equals('activeDualButtonLeft',this._buttonLeftId) or Session.equals('activePane',this._buttonLeftState) then 'active' else ''

Template.dualButton.activeDualButtonRight = ->
	if Session.equals('activeDualButtonRight',this._buttonRightId) or Session.equals('activePane',this._buttonRightState)  then 'active' else ''

Template.dualButton.events
	'click .dualButton': (e,t) ->
		log 'dualButton clicked'
		currentTarget = $(e.currentTarget)
		state = currentTarget.data('state')
		#Session.set('activeCircleButton',undefined)

		#Set the Active Button
		if currentTarget.hasClass('left')
			log 'Left button clicked'
			if Session.equals('activeDualButtonLeft',this._buttonLeftId)
				Session.set('activeDualButtonLeft',undefined)
				hideModal()
			else
				Session.set('activeDualButtonRight',undefined)
				Session.set('activeDualButtonLeft',this._buttonLeftId)
		else if currentTarget.hasClass('right')
			log 'Right button clicked'
			if Session.equals('activeDualButtonRight',this._buttonRightId)
				Session.set('activeDualButtonRight',undefined)
				hideModal()
			else
				Session.set('activeDualButtonLeft',undefined)
				Session.set('activeDualButtonRight',this._buttonRightId)

		#Trigger the dependent function based on the button's state
		switch state
			when 'profile' then toggleProfile()
			when 'browse' then toggleBrowse()
			when 'login' then showModal(state)
			when 'signup' then showModal(state)

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
