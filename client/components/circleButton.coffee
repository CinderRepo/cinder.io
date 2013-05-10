Template.circleButton.active = ->
	log 'Checking active'
	if Session.equals('activeCircleButton',this._id) then 'active' else ''

Template.circleButton.events
	'click .circleButton':(e,t)->
		log 'circleButton clicked'
		currentTarget = $(e.currentTarget)
		state = currentTarget.data('state')

		if Session.equals('activeCircleButton',this._id)
			Session.set('activeCircleButton',undefined)
			hideModal()
		else
			Session.set('activeCircleButton',this._id)
			showModal(state)

Template.circleButton.preserve({
	'.circleButton'	
})

@showModal = (state) ->
	log 'TOGGLE MODAL!'
	Session.set('activeModal',state)
	#For some reason this has to be wrapped in a setTimeout otherwise it won't calculate the height properly.
	#Yes, I've hardcoded the heights. It's easier this way than trying to set up the proper calculations needed.
	#Our design is such that a modalForm shouldn't be more than 3 rows anyways, so this should be just fine.
	Meteor.setTimeout(()->
		if Session.get('inputThreePlaceholder') is undefined
			#If the modal is a two row layout
			Session.set('revealedDownHeight',220) #Height of Modal (200px) + Margin (20px)
			Session.set()
		else
			#If the modal is a three row layout
			Session.set('revealedDownHeight',270) #Height of Modal (250px) + Margin (20px)
		Session.set('revealedDown',true)
	,0)

@hideModal = () ->
	Session.set('revealedDown',false)
	Session.set('revealedDownHeight',0)
