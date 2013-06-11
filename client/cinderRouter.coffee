#Handle different application states
Meteor.Router.add
  "/":
    to: "main"
    and: () ->
      log '/'
      Session.set('appState','browse')
  "/:_gameId":
    to: "main"
    and: (gameId) ->
      log 'VIEWING PREVIEW STATE'
      Session.set('appState','view')
      Session.set('activeTile',gameId)
      Session.set('disableScrolling',true)
  "/:_gameId/view":
    to: "main"
    and: (gameId) ->
      log 'VIEWING VIEW STATE'
      Session.set('appState','view')
      Session.set('activeTile',gameId)
  "/:_gameId/view/play":
    to: "main"
    and: (gameId) ->
      log 'VIEWING GAME STATE'
      if Session.equals('appState',undefined)
        Session.set('appState','play')
      if Session.equals('activeTile',undefined)
        Session.set('activeTile',gameId)
  "*":
    to: "main"
    and: () ->
      log 'FUCKING'