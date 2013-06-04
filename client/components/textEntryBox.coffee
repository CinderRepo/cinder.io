Template.textEntryBox.events 'submit .textEntryForm':(e,t) ->
	log 'TextEntryBox Submitted.'
	e.stopImmediatePropagation()
	textField = t.find('.textEntryText')
	text = textField.value
	Games.update
	  _id: @_id
	,
	  $addToSet:
	    messages:
	      #name: Meteor.user().username
	      text: text
	textField.value = ''
	false

Template.textEntryBox.preserve({
	'.textEntryBox'
})