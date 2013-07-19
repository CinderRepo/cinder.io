Template.dualButton.events
	'click .innerDualButton': (e,t) ->
		e.stopImmediatePropagation()
		target = $(e.currentTarget)
		href = target.data('href')
		if Meteor.user()
			Meteor.Router.to '/' + href
			#Meteor.Router.to '/downloads/' + Session.get('currentOS') + '/fire.zip'
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
	'.middleButton'
	'.innerDualButton.right'
})