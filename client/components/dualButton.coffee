Template.dualButton.events
	'click .innerDualButton': (e,t) ->
		e.stopImmediatePropagation()
		href = e.currentTarget.getAttribute('data-href')
		log href
		#href = target.data('href')
		#log href
		if Meteor.user()
			#log 'This one'
			#log href
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