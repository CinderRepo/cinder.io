#Handle different application states
Meteor.Router.add
  "/":
    to: "main"
    and: () ->
      log '/'
      Session.set('appState','browse')
      Session.set('disableScrolling',false)
  "/:_gameId":
    to: "main"
    and: (gameId) ->
      log 'VIEWING PREVIEW STATE'
      Session.set('appState','view')
      Session.set('activeTile',gameId)
      Session.set('activePane','info')
      Session.set('disableScrolling',true)
  "/:_gameId/play":
    to: "main"
    and: (gameId) ->
      log 'VIEWING GAME STATE'
      Session.set('appState','play')
      Session.set('activePane','play')
      Session.set('activeTile',gameId)
      Session.set('disableScrolling',true)
      if Meteor.user()
        GameSessions.insert({},{'userId':Meteor.user().username, 'gameId':Session.get('activeTile')})
  "/downloads/" + Session.get('currentOS') + "/pretendthisisfiremacversion.zip":
    to: "main"
    and: () ->
      log 'DOWNLOADING'
      path = Npm.require('path')
      fs = Npm.require('fs')
      file = '/downloads/' + Session.get('currentOS') + '/pretendthisisfiremacversion.zip'
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