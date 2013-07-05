Template.dualButton.events
	'click .innerDualButton': (e,t) ->
		log 'innerDualButton Clicked.'
		e.stopImmediatePropagation()
		href = $(e.currentTarget).data('href')
		log href
		if href is 'create'
			Meteor.Router.to '/downloads/' + Session.get('currentOS') + '/fire.zip'
		else
			if Session.equals('modalState',href)
				Session.set('modalState',undefined)
			else
				Session.set('modalState',href)

Template.dualButton.preserve({
	'.dualButton'
	'.innerDualButton.left'
	'.middleButton'
	'.innerDualButton.right'
})