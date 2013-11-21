###Mesosphere
  name: "loginForm"
  method: loginUser = (rawFormData)->
    log 'loginUser called'
    log rawFormData
    log "rawFormData", rawFormData

    validationObject = Mesosphere.loginForm.validate(rawFormData)
    log "validationObject", validationObject

    if validationObject.errors
      log "Errors!"
      log "validationObject.errors:",validationObject.errors
    else
      log "No Errors Present!"
      log "validationObject",validationObject

      log validationObject.formData.usernameOrEmail
      log validationObject.formData.password

      log 'Attempting user login..'
      Meteor.loginWithPassword(
        validationObject.formData.usernameOrEmail
        validationObject.formData.password
        (error)->
          if error
            log 'Error occurred logging in user!'
            log error
          else
            log 'login completed successfully!'
      )
  fields:
    usernameOrEmail:
      required: true
      message: "Not an email"
    password:
      required: true
      message: ""
  onFailure:(erroredFields)->
    log 'FAILURE'
    #Set errors relevant to the form
    _.each erroredFields, (value,key)->
      form = $('#loginForm')
      error = form.find('.error[data-field="' + key + '"]')
      error.text(value.message)
  onSuccess:(formData)->
    log 'SUCCESS'
    #Clear all errors
    form = $('#loginForm')
    errors = form.find('.error')
    errors.text('')###