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
  "*":
    to: "main"
    and: () ->
      log 'FUCKING'