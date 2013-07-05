###DEV###
Meteor.methods
  sendEmail:(to,from,subject,text)->
    #check [to,from,subject,text]

    #Let other method calls from same client continue to run without waiting for the email send to complete
    this.unblock()

    Email.send
      to: to
      from: from
      subject: subject
      text: text