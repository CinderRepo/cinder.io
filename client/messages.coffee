###Template.messages.title = ->
	title: 'Messages'

Template.messages.events 'submit .textEntryForm': (event, template) ->
	textField = template.find('.textEntryText')
	text = textField.value
	Games.update
	  _id: @_id
	,
	  $addToSet:
	    messages:
	      name: Meteor.user().username
	      text: text
	textField.value = ''
	false

Template.messages.preserve [
	'.messages'
]###