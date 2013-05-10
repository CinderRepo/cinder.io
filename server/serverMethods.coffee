###DEV###
Meteor.methods saveGame: (data, id) ->
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