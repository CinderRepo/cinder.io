#Template.circleButton.state = ->
	#this.state

Template.circleButton.active = ->
	if Session.equals('activeCircleButton',this._id) then 'active' else ''

Template.circleButton.events
	'click .circleButton':(e,t)->
		log 'circleButton clicked'
		e.stopImmediatePropagation()
		if this.state is 'logout'
			Meteor.logout()
		else if this.state is 'exit'
			Meteor.Router.to '/' + $(e.currentTarget).data('href')
		else if this.state is 'yes'
			$('#gamePlayer')[0].contentWindow.location.reload(true)
			Session.set('activeNotification',false)
		else if this.state is 'no'
			Session.set('activeNotification',false)
		else
			if Session.equals('modalState',this.state)
				Session.set('modalState',undefined)
			else
				Session.set('modalState',this.state)

Template.circleButton.preserve({
	'.circleButton'
})