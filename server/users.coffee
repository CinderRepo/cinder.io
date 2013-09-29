Meteor.users.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true

Meteor.publish "allUsers", ->
  Meteor.users.find()

#Validate user creation and to the user object
###Accounts.validateNewUser (user) ->
  log "validateNewUser called."
  log "user:",user

  if user.anonymous and !user.username and !user.emails and !user.password
    #log 'User is anonymous, and no username/emails/passwords have been passed in. Create an empty anonymous user.'
    true
  else
    #Only fire if all arguments are properly passed in and user is not anonymous.
    log "CHECKING THIS SHIT!"
    rawFormData = [
      name: "username"
      value: user.username
    ,
      name: "email"
      value: user.emails[0].address
    ,
      name: "password"
      value: user.services.password
    ]

    validationObject = Mesosphere.signupForm.validate(rawFormData)
    #If errors exist, generate the proper notifications to send back to the client.
    if validationObject.errors
      _.each validationObject.formData, (value,key) ->
        if validationObject.errors[key]
          #Send a notification and return false if there's an error
          sendNotification
            field: key
            message: validationObject.errors[key].message
          false
        else
          #Clear a notification if there's no error for that field,
          #this is to clear errors that may exist already but have since
          #been corrected by validation.
          clearNotification
            field: key
            message: value.message
    else
      #No errors exist, we can return true and create the user.
      true###