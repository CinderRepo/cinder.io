Session.setDefault('topModalFormInputWrapperState','placeholder')
Session.setDefault('middleModalFormInputWrapperState','placeholder')
Session.setDefault('bottomModalFormInputWrapperState','placeholder')

Template.modal.events
	'submit .modalForm':(e,t)->
		e.preventDefault()
		e.stopImmediatePropagation()
		#Get the state
		state = Session.get('modalState')
		if state is 'login'
			username = $('.modalFormInput[name="username"]').attr('value')
			password = $('.modalFormInput[name="password"]').attr('value')
			loginUser(username,password)
		if state is 'signup'
			username = $('.modalFormInput[name="username"]').attr('value')
			email = $('.modalFormInput[name="email"]').attr('value')
			password = $('.modalFormInput[name="password"]').attr('value')
		if state is 'feedback'
			log 'HELLO FEEDBACK'
			textAreaValue = t.find('.modalFormTextArea').value

			#Call the sendEmail method on the server
			if Meteor.user()
				Meteor.call('sendEmail',
						'feedback@cinder.io',
						Meteor.user().emails[0],
						Meteor.user().username + ' gave us feedback!',
						textAreaValue + ' Browser Agent: ' + navigator.userAgent
					)
			else
				Meteor.call('sendEmail',
						'feedback@cinder.io',
						'guest@guest.com',
						'A logged out guest gave us feedback!',
						textAreaValue + ' Browser Agent: ' + navigator.userAgent
					)
			#Close the modal
			analytics.track 'User sent site feedback'
			Session.set('oldModalState',Session.get('modalState'))
			Session.set('modalState',undefined)
	'click .modal':(e,t)->
		#This event only exists to prevent the container click event from firing when the user clicks on modal.
		#e.stopImmediatePropagation()
		#log 'This event only exists to prevent the container click event from firing when the user clicks on modal.'
	'click .modalFormInputWrapper .modalFormInput,
	focus .modalFormInputWrapper .modalFormInput':(e,t)->
		#e.stopImmediatePropagation()
		target = $(e.currentTarget)
		targetParent = target.parent('.modalFormInputWrapper')
		if targetParent.hasClass('top')
			Session.set('topModalFormInputWrapperState',undefined)
		if targetParent.hasClass('middle')
			Session.set('middleModalFormInputWrapperState',undefined)
		if targetParent.hasClass('bottom')
			Session.set('bottomModalFormInputWrapperState',undefined)
	'blur .modalFormInputWrapper .modalFormInput':(e,t)->
		#e.stopImmediatePropagation()
		target = $(e.currentTarget)
		targetParent = target.parent('.modalFormInputWrapper')
		if targetParent.hasClass('top') and target.attr('value') is ''
			Session.set('topModalFormInputWrapperState','placeholder')
		if targetParent.hasClass('middle') and target.attr('value') is ''
			Session.set('middleModalFormInputWrapperState','placeholder')
		if targetParent.hasClass('bottom') and target.attr('value') is ''
			Session.set('bottomModalFormInputWrapperState','placeholder')

loginUser = (username,password) ->
	log 'loginUser called'
	Meteor.loginWithPassword username, password, (err) ->
		if err
			log err
			Session.set('topModalFormInputWrapperState','error')
			Session.set('topModalFormInputMessage',err.reason)
			analytics.track 'User encountered error while logging in',
				err: err
			return err
		else
			log 'Logging in'
			Session.set('oldModalState',Session.get('modalState'))
			Session.set('modalState',undefined)

signupUser = () ->
	log 'signupUser called'

sendFeedback = () ->
	log 'sendFeedback called'

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