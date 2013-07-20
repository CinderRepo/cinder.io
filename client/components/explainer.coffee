Template.explainer.events
	'click #explainerProgress':(e,t)->
		log 'explainerProgress clicked'
		e.stopImmediatePropagation()
	'click .explainerProgressDot':(e,t)->
		log 'explainerProgressDot clicked'
		e.stopImmediatePropagation()
Template.explainer.preserve({
	'#explainer'
})