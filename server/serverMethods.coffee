###DEV###
Meteor.methods
  saveGame: (data, id) ->
    log 'TRYING TO SAVE GAME'
    fs = Npm.require("fs")
    fs.writeFile "./public/games/" + id + ".html", data, "binary", (err) ->
      return console.log(err)  if err
      console.log "File upload complete."

    Games.update
      _id: id
    ,
      $set:
        src: "/games/" + id + ".html"
  sendEmail:(to,from,subject,text)->
    #check [to,from,subject,text]

    #Let other method calls from same client continue to run without waiting for the email send to complete
    this.unblock()

    Email.send
      to: to
      from: from
      subject: subject
      text: text

###PRODUCTION###
###Meteor.methods saveGame: (data, id) ->
  log 'TRYING TO SAVE GAME'
  fs = Npm.require("fs")
  fs.writeFile "/www/games.cinder.io/" + id + ".html", data, "binary", (err) ->
    return console.log(err)  if err
    console.log "File upload complete."

  Games.update
    _id: id
  ,
    $set:
      src: "http://games.cinder.io/" + id + ".html"###