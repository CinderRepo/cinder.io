Template.modal.state = ->
	state = Session.get('activeModal')
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
		when 'login'
			Session.set('inputOnePlaceholder','Username')
			Session.set('inputOneType','text')
			Session.set('inputTwoPlaceholder','Password')
			Session.set('inputTwoType','password')
			Session.set('inputThreePlaceholder',undefined)
			Session.set('inputThreeType','text')
		when 'signup'
			Session.set('inputOnePlaceholder','Username (Coming Soon)')
			Session.set('inputOneType','text')
			Session.set('inputTwoPlaceholder','Email (Coming Soon)')
			Session.set('inputTwoType','text')
			Session.set('inputThreePlaceholder','Password (Coming Soon)')
			Session.set('inputThreeType','text')
		else
			Session.set('inputOnePlaceholder','')
			Session.set('inputOneType','text')
			Session.set('inputTwoPlaceholder','')
			Session.set('inputTwoType','text')
			Session.set('inputThreePlaceholder','')
			Session.set('inputThreeType','text')
			Session.set('inputThreePlaceholder',undefined)
			Session.set('inputThreeType','text')
	state

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
Template.modal.cancel = ->
	state: 'cancel'
	message: 'Cancel'
Template.modal.confirm = ->
	state: 'confirm'
	message: 'Confirm'
Template.modal.logout = ->
	state: 'logout'
	message: 'L'

Template.modal.events
	'click .button[data-state="logout"]':(e,t)->
		e.preventDefault()
		Meteor.logout()
		Session.set('revealedDown',false)
		Session.set('revealedDownHeight',0)
		Session.set('activeModal',undefined)
	'click .button[data-state="cancel"]':(e,t)->
		log 'CANCEL STATE'
		e.preventDefault()
		Session.set('revealedDown',false)
		nav = document.querySelector('.nav')
		nav.classList.remove('active')
	'click .button[data-state="confirm"],
	submit .modalForm':(e,t)->
		log 'SUBMIT FORM'
		e.preventDefault()
		#Get the state
		log t.find('.modal')
		currentModal = t.find('.modal')
		currentState = currentModal.getAttribute('data-state')
		log 'ASADFDFSDF'
		log currentState

		if currentState == 'login'
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
					Session.set('revealedDown',false)
					Session.set('revealedDownHeight',0)
					Session.set('activeDualButtonLeft',undefined)
		else if currentState == 'add'
			log 'HELLO ADD'
			nameField = t.find('.modalFormInputWrapper.one .modalFormInput')
			genreField = t.find('.modalFormInputWrapper.two .modalFormInput')
			name = nameField.value
			genre = genreField.value
			Games.insert
				name: name
				genre: genre
				gameBy: Meteor.user().username
			Session.set('revealedDown',false)
			Session.set('revealedDownHeight',0)
			Session.set('activeCircleButton',undefined)
			log 'asdf'

Template.modal.preserve({
	'.modal'
	'.modalFormInputWrapper.one'
	'.modalFormInputWrapper.two'
	'.modalFormInputWrapper.three'
	'.modalFormHeaderTitle'
	'.modalFormHeaderButton.left'
	'.modalFormHeaderButton.right'
})