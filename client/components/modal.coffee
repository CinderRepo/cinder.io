Session.setDefault('topModalFormInputWrapperState','placeholder')
Session.setDefault('middleModalFormInputWrapperState','placeholder')
Session.setDefault('bottomModalFormInputWrapperState','placeholder')

Template.modal.events
	'submit .modalForm':(e,t)->
		e.preventDefault()
		e.stopImmediatePropagation()
		target = $(e.currentTarget)
		log target
		#Get the state
		state = Session.get('modalState')
		if state is 'login'
			username = target.find('.modalFormInput[name="username"]').attr('value')
			password = target.find('.modalFormInput[name="password"]').attr('value')
			loginUser(username,password)
		if state is 'signup'
			username = target.find('.modalFormInput[name="username"]').attr('value')
			email = target.find('.modalFormInput[name="email"]').attr('value')
			password = target.find('.modalFormInput[name="password"]').attr('value')
			signupUser(username,email,password)
		if state is 'feedback'
			log 'HELLO FEEDBACK'
			message = $('.modalFormTextArea').attr('value')
			log message
			sendFeedback(message)
	'click .modal':(e,t)->
		#This event only exists to prevent the container click event from firing when the user clicks on modal.
		#e.stopImmediatePropagation()
		#log 'This event only exists to prevent the container click event from firing when the user clicks on modal.'

loginUser = (username,password) ->
	log 'loginUser called'
	Meteor.loginWithPassword username, password, (err) ->
		if err
			log err
			analytics.emit 'User encountered error while logging in',
				err: err
			return err
		else
			log 'Logging in'
			Session.set('oldModalState',Session.get('modalState'))
			Session.set('modalState',undefined)

signupUser = (username,email,password) ->
	log 'signupUser called'
	log username
	log email
	log password
	Accounts.createUser
		username: username
		email: email
		password: password
		profile:
			avatar: '/avatars/default.png'
			cinderFireInstalled: false
	, (err) ->
		if err
			log err
			analytics.emit 'User encountered error while creating account',
				err: err
			return err
		else
			log 'Creating user!'
			Session.set('oldModalState',Session.get('modalState'))
			Session.set('modalState',undefined)

sendFeedback = (message) ->
	log 'sendFeedback called'
	log message
	Meteor.call('sendEmail',
		'feedback@cinder.io',
		'users@cinder.io',
		'A user gave us feedback!',
		message + ' Browse Agent: ' + navigator.userAgent
		, (err) ->
			if err
				log err
				analytics.emit 'User encountered error while sending feedback',
					err: err
				return err
			else
				log 'Sending feedback!'
				#Close the modal
				analytics.emit 'User sent site feedback'
				Session.set('oldModalState',Session.get('modalState'))
				Session.set('modalState',undefined)
	)

Template.modal.preserve({
	'.modal'
	'.modalFormHeader'
	'.modalFormHeaderIcon'
	'.modalForm'
	'.modalFormWrapper.login'
	'.modalFormWrapper.signup'
	'.modalFormWrapper.feedback'
	'.modal'
	'.modalFormHeaderTitle'
	'.modalFormInputWrapper.top'
	'.modalFormInputWrapper.middle'
	'.modalFormInputWrapper.bottom'
	'.modalFormInputWrapper.top .modalFormInputIcon'
	'.modalFormInputWrapper.middle .modalFormInputIcon'
	'.modalFormInputWrapper.bottom .modalFormInputIcon'
	'.modalFormInputWrapper.top .modalFormInput'
	'.modalFormInputWrapper.middle .modalFormInput'
	'.modalFormInputWrapper.bottom .modalFormInput'
	'.modalFormInputWrapper.top .modalFormInputPlaceholder'
	'.modalFormInputWrapper.middle .modalFormInputPlaceholder'
	'.modalFormInputWrapper.bottom .modalFormInputPlaceholder'
	'.modalFormInputWrapper.top .modalFormInputPlaceholderText'
	'.modalFormInputWrapper.middle .modalFormInputPlaceholderText'
	'.modalFormInputWrapper.bottom .modalFormInputPlaceholderText'
	'.modalFormInputWrapper.top .modalFormInputMessage'
	'.modalFormInputWrapper.middle .modalFormInputMessage'
	'.modalFormInputWrapper.bottom .modalFormInputMessage'
	'.modalFormButtons'
	'.modalFormButton'
	'.modalFormButtonIcon'
})
