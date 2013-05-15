Template.button.events
	'click .button':(e,t)->
		log 'Button Clicked.'
		e.stopImmediatePropagation()
		if this.state is 'login'
			log 'LOGINS TATE'
		else
			Session.set('appState',this.state)

Template.button.preserve({
	'.button'	
})