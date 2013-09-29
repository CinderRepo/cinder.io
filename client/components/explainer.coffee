Session.setDefault 'explainerState',0
maxExplainerStates = 4

Template.explainer.events
	'click #explainerProgress':(e,t)->
		log 'explainerProgress clicked'
		e.stopImmediatePropagation()
	'click .explainerButtonContent':(e,t)->
		log 'explainerButtonContent clicked'
		e.stopImmediatePropagation()
		href = e.currentTarget.getAttribute('data-href')
		unless Session.equals('explainerState',maxExplainerStates)
			if href
				Meteor.Router.to href
			Session.set('explainerState',Session.get('explainerState')+1)
	'click .explainerProgressDot':(e,t)->
		log 'explainerProgressDot clicked'
		e.stopImmediatePropagation()
		href = $(e.currentTarget).data('href')
		Session.set 'explainerState',href

Template.explainer.preserve({
	'#explainer'
	'#explainerIconsWrapper'
	'#explainerText'
	'#explainerText0'
	'#explainerText1'
	'#explainerText2'
	'#explainerText3'
	'#explainerText4'
	'#explainerButton'
	'#explainerButton0'
	'#explainerButton1'
	'#explainerButton2'
	'#explainerButton3'
	'#explainerButton4'
	'#explainerProgress'
	'#explainerProgress0'
	'#explainerProgress1'
	'#explainerProgress2'
	'#explainerProgress3'
	'#explainerProgress4'
	'.installFireIconWrapper'
	'.waitingIconWrapper'
	'.folderIconWrapper'
	'.newIconWrapper'
	'.deployIconWrapper'
	'.ideaIconWrapper'
})