#Handle different application states
Meteor.Router.add
  "/":
    to: "main"
    and: () ->
      log '/'
      Session.set('appState','browse')
      #Session.set('disableScrolling',false)
  "/:_gameId/view":
    to: "main"
    and: (gameId) ->
      log 'VIEWING VIEW STATE'
      Session.set('appState','view')
      Session.set('activeTile',gameId)
      #Session.set('disableScrolling',true)
  "/create":
    to: "main"
    and: () ->
        Session.set('appState','create')
        Session.set('activeTile',undefined)
  "/:_gameId/play":
    to: "main"
    and: (gameId) ->
      log 'VIEWING GAME STATE'
      Session.set('appState','play')
      Session.set('activeTile',gameId)
      #Session.set('disableScrolling',true)
      if Meteor.user()
        GameSessions.insert({},{'userId':Meteor.user().username, 'gameId':Session.get('activeTile')})
  "/:_gameId/community":
    to: "main"
    and: (gameId) ->
      log 'VIEWING COMMUNITY STATE'
      Session.set('appState','community')
      Session.set('activeTile',gameId)
      #Session.set('disableScrolling',true)
  "/downloads/" + Session.get('currentOS') + "/fire.zip":
    to: "main"
    and: () ->
      log 'DOWNLOADING'
      path = Npm.require('path')
      fs = Npm.require('fs')
      file = '/downloads/' + Session.get('currentOS') + '/fire.zip'
      filename = path.basename(file)
      [200,
        'MIME-Type' : 'application/zip'
        'Content-Type' : 'application/x-unknown'
        'Content-Disposition' : 'attachment; filename=' + filename
      ,fs.readFileSync(file)]
  "*":
    to: "main"
    and: () ->
      log 'FUCKING'