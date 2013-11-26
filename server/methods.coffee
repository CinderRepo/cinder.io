Meteor.methods
	sendEmail: (to,from,subject,text) ->
		#check [to,from,subject,text]
		#Let other method calls from same client continue to run without waiting for the email send to complete
		this.unblock()
		Email.send
			to: to
			from: from
			subject: subject
			text: text
	validateUser: (username,password) ->
		log 'Okay, let\'s do this shit'
		log username
		log password
		return `undefined` if not username or not password #Don't handle if empty values
		user = Meteor.users.findOne 'username':username
		throw new Meteor.Error(403, 'User not found') unless user
		throw new Meteor.Error(403, 'User has no password set') if not user.services or not user.services.password or not user.services.password.srp

		#Just check the verifier output when the same identity and salt are passed. Don't bother with a full exchange.
		verifier = user.services.password.srp
		newVerifier = SRP.generateVerifier(password,
			identity: verifier.identity
			salt: verifier.salt
		)
		throw new Meteor.Error(403, 'Incorrect password') if verifier.verifier isnt newVerifier.verifier

		#Generate a token to maintain the logged in user session
		#stampedLoginToken = Accounts._generateStampedLoginToken()
		#Meteor.users.update user._id,
		#	$push:
		#		'services.resume.loginTokens': stampedLoginToken
		#token: stampedLoginToken.token
		#id: user._id
		log 'Everything is peachy here!'
		log JSON.stringify user
		return true
	createFolder: (username,folder,gameId) ->
		log "createFolder called. Building url."
		baseUrl = "http://cinder.io:61045/app/remote/folder/create"
		usernameParam = "username=#{username}"
		folderNameParam = "folderName=#{folder}"
		gameIdParam = "gameID=#{gameId}"
		url = baseUrl + "?" + usernameParam + "&" + folderNameParam + "&" + gameIdParam
		log "created url url: ",url
		log "Posting url"
		HTTP.post(url,
			null
		,
			(err,result)->
				if err
					log "err: ",err
				else
					log "result: ",result
					log "Hello! Posted! Successful!"
		)
