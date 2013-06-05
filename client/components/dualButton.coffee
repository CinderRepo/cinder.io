Template.dualButton.activeDualButtonLeft = ->
	#log 'Checking active'
	#if Session.equals('activeDualButtonLeft',this._buttonLeftId) or Session.equals('activePane',this._buttonLeftState) then 'active' else ''

Template.dualButton.activeDualButtonRight = ->
	#if Session.equals('activeDualButtonRight',this._buttonRightId) or Session.equals('activePane',this._buttonRightState)  then 'active' else ''

Template.dualButton.events
	'click .dualButton': (e,t) ->
		log 'DualButton Clicked.'
		e.stopImmediatePropagation()
		state = $(e.currentTarget).data('state')
		if state is 'exitGame'
			#Exit Game Here
			Session.set('appState','view')
			Meteor.Router.to '/' + $(e.currentTarget).data('href')
		else
			if Session.equals('modalState',state)
				Session.set('modalState',undefined)
			else
				Session.set('modalState',state)

Template.dualButton.preserve({
	'.dualButtonWrapper'
	'.dualButton.left'
	'.dualButtonMiddle'
	'.dualButton.right'
})