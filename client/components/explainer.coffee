Session.setDefault 'explainerState',0
maxExplainerStates = 4

Template.explainer.events
	'click #explainerProgress':(e,t)->
		log 'explainerProgress clicked'
		e.stopImmediatePropagation()
	'click #explainerButton':(e,t)->
		log 'explainerButton clicked'
		target = $(e.currentTarget).find('.explainerButtonLink')
		href = target.data('href')
		log href
		e.stopImmediatePropagation()
		#IF we've reached the max amount of explainer states, make it invisible
		if Session.equals('explainerState',maxExplainerStates)
			#Meteor.Router.to '/view'
		else
			#Download Cinder Fire if it's the first step
			if Session.equals('explainerState',0)
				log 'Download here'
				Meteor.Router.to href
			#Advance the explainer forward when the user clicks on the button
			Session.set('explainerState',Session.get('explainerState')+1)
	'click .explainerProgressDot':(e,t)->
		log 'explainerProgressDot clicked'
		e.stopImmediatePropagation()
		href = $(e.currentTarget).data('href')
		Session.set 'explainerState',href

Template.explainer.preserve({
	'#explainer'
})