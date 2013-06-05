Template.button.events
	'click .button':(e,t)->
		log 'Button Clicked.'
		e.stopImmediatePropagation()
		if this.state is 'login'
			log 'LOGINS TATE'
		else if this.state is 'logout'
			Meteor.logout()
			Session.set('modalState',undefined)
		else
			Session.set('appState',this.state)
			Meteor.Router.to '/' + $(e.currentTarget).data('href')

Template.button.preserve({
	'.button'
})