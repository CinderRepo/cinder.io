Template.textEntryBox.signedIn = ->
  Meteor.user()

Template.textEntryBox.events 'submit .textEntryForm':(e,t) ->
	e.preventDefault()
	e.stopImmediatePropagation()
	textField = t.find('.textEntryText')
	text = textField.value
	Games.update
	  _id: Session.get('activeTile')
	,
	  $addToSet:
	    messages:
	      username: Meteor.user().username
	      text: text
	, (err)->
		analytics.emit 'User created message'
		if err
			return alert err
			analytics.emit 'User encountered error while submitting message',
				err: err

Template.textEntryBox.preserve({
	'.textEntryBox'
})
