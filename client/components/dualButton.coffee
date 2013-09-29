Template.dualButton.events
	'click .innerDualButtonText': (e,t) ->
		e.stopImmediatePropagation()
		href = e.currentTarget.getAttribute('data-href')
		if Meteor.user()
			Meteor.Router.to '/' + href
		else
			if Session.equals('modalState',href)
				Session.set('oldModalState',Session.get('modalState'))
				Session.set('modalState',undefined)
			else
				Session.set('oldModalState',Session.get('modalState'))
				Session.set('modalState',href)

Template.dualButton.preserve({
	'.dualButton'
	'.innerDualButton.left'
	'#leftInnerDualButtonText1'
	'#leftInnerDualButtonText2'
	'.middleButton'
	'#avatar1'
	'#avatar2'
	'#avatar3'
	'.innerDualButton.right'
	'#rightInnerDualButtonText1'
	'#rightInnerDualButtonText2'
})