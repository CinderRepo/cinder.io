Template.modal.state = ->
	state = Session.get('modalState')
	switch state
		when 'settings'
			Session.set('inputOnePlaceholder','Change Username (Coming Soon)')
			Session.set('inputOneType','text')
			Session.set('inputTwoPlaceholder','Change Email (Coming Soon)')
			Session.set('inputTwoType','text')
			Session.set('inputThreePlaceholder','Change Password (Coming Soon)')
			Session.set('inputThreeType','text')
		when 'add'
			Session.set('inputOnePlaceholder','Game Name')
			Session.set('inputOneType','text')
			Session.set('inputTwoPlaceholder','Genre')
			Session.set('inputTwoType','text')
			Session.set('inputThreePlaceholder',undefined)
			Session.set('inputThreeType','text')
			Session.set('modalButtonValue','Add')
		when 'login'
			Session.set('inputOnePlaceholder','Username')
			Session.set('inputOneType','text')
			Session.set('inputTwoPlaceholder','Password')
			Session.set('inputTwoType','password')
			Session.set('inputThreePlaceholder',undefined)
			Session.set('inputThreeType','text')
			Session.set('modalButtonValue','Login')
		when 'signup'
			Session.set('inputOnePlaceholder','Username (Coming Soon)')
			Session.set('inputOneType','text')
			Session.set('inputTwoPlaceholder','Email (Coming Soon)')
			Session.set('inputTwoType','text')
			Session.set('inputThreePlaceholder','Password (Coming Soon)')
			Session.set('inputThreeType','text')
		when 'profile'
			Session.set('inputOnePlaceholder','Username (Coming Soon)')
			Session.set('inputOneType','text')
			Session.set('inputTwoPlaceholder','Email (Coming Soon)')
			Session.set('inputTwoType','text')
			Session.set('inputThreePlaceholder','Password (Coming Soon)')
			Session.set('inputThreeType','text')
			Session.set('modalButtonValue','Coming Soon')
		when 'feedback'
			Session.set('textareaPlaceholder','Please type your feedback here.')
			Session.set('modalButtonValue','Send Feedback')
		#else
		#	Session.set('inputOnePlaceholder','')
		#	Session.set('inputOneType','text')
		#	Session.set('inputTwoPlaceholder','')
		#	Session.set('inputTwoType','text')
		#	Session.set('inputThreePlaceholder','')
		#	Session.set('inputThreeType','text')
		#	Session.set('inputThreePlaceholder',undefined)
		#	Session.set('inputThreeType','text')
	state
Template.modal.isFeedback = ->
	if Session.equals('modalState','feedback')
		true
	else
		false
Template.modal.textareaPlaceholder = ->
	Session.get('textareaPlaceholder')
Template.modal.inputOnePlaceholder = ->
	Session.get('inputOnePlaceholder')
Template.modal.inputTwoPlaceholder = ->
	Session.get('inputTwoPlaceholder')
Template.modal.inputThreePlaceholder = ->
	Session.get('inputThreePlaceholder')
Template.modal.inputOneType = ->
	Session.get('inputOneType')
Template.modal.inputTwoType = ->
	Session.get('inputTwoType')
Template.modal.inputThreeType = ->
	Session.get('inputThreeType')
Template.modal.modalButtonValue = ->
	Session.get('modalButtonValue')
Template.modal.cancel = ->
	state: 'cancel'
	message: 'Cancel'
Template.modal.confirm = ->
	if Session.equals('modalState','login')
		state: 'login'
		message: 'Login'
	else if Session.equals('modalState','signup')
		state: 'signup'
		message: 'Signup'
Template.modal.logout = ->
	state: 'logout'
	message: 'L'

Template.modal.events
	'submit .modalForm':(e,t)->
		log 'SUBMIT FORM'
		e.preventDefault()
		e.stopImmediatePropagation()
		#Get the state
		state = Session.get('modalState')

		if state == 'login'
			usernameField = t.find('.modalFormInputWrapper.one .modalFormInput')
			passwordField = t.find('.modalFormInputWrapper.two .modalFormInput')
			username = usernameField.value
			password = passwordField.value
			log 'asdf'
			Meteor.loginWithPassword username, password, (err) ->
				if err
					return alert(err)
					usernameField.value = ''
					passwordField.value = ''
				else
					log 'Something'
					Session.set('modalState',undefined)
		else if state == 'add'
			log 'HELLO ADD'
			nameField = t.find('.modalFormInputWrapper.one .modalFormInput')
			genreField = t.find('.modalFormInputWrapper.two .modalFormInput')
			name = nameField.value
			genre = genreField.value
			Games.insert
				name: name
				genre: genre
				gameBy: Meteor.user().username
			, (err,id) ->
				log 'Game inserted successfully!'
				log err
				log id
				Session.set('activeTile',id)
				Session.set('appState','view')
				Session.set('modalState',undefined)
		else if state == 'feedback'
			log 'HELLO FEEDBACK'
			textAreaValue = t.find('.modalFormTextArea').value

			#Call the sendEmail method on the server
			Meteor.call('sendEmail',
				'feedback@cinder.io',
				Meteor.user().emails[0],
				Meteor.user().username + ' gave us feedback!'
				textAreaValue
			)

			#Close the modal
			Session.set('modalState',undefined)

Template.modal.preserve({
	'.modal'
	'.modalFormInputWrapper.one'
	'.modalFormInputWrapper.two'
	'.modalFormInputWrapper.three'
	'.modalFormHeaderTitle'
	'.modalFormHeaderButton.left'
	'.modalFormHeaderButton.right'
})