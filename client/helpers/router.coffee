#Handle different application states
Meteor.Router.add
  #Browse State
  ###"/":
    to: "main"
    and: () ->
      log 'MAIN PAGE'
      if Session.equals('appState',undefined)
        Session.set('appState','browse')
  #Preview State
  "/:_preview":
    to: "main"
    and: (preview) ->
      log 'VIEWING PREVIEW STATE'
      #log 'ID PAGE STUFF'
      #log preview
      if Session.equals('appState',undefined)
        Session.set('appState','preview')
      if Session.equals('activeTile',undefined)
        Session.set('activeTile',preview)
  #View State
  "/:_preview/view":
    to: "main"
    and: (preview) ->
      log 'VIEWING VIEW STATE'
      log preview
      if Session.equals('appState',undefined)
        Session.set('appState','view')
      if Session.equals('activeTile',undefined)
        Session.set('activeTile',preview)
  #Play State
  "/:_preview/view/play":
    to: "main"
    and: (preview) ->
      log 'VIEWING PLAY STATE'
      log preview
      if Session.equals('appState',undefined)
        Session.set('appState','play')
      if Session.equals('activeTile',undefined)
        Session.set('activeTile',preview)
      unless Session.equals('activeTile',undefined) and Session.equals('appState',undefined)
        log 'Setting focus'
        gamePlayerContent = $('#gamePlayerContent')[0]
        if gamePlayerContent
          gamePlayerContent.contentWindow.focus()###
  "/":
    to: "main"
    and: () ->
      log '/'
      Session.set('appState','browse')
      Session.set('activeTile',undefined)
  "/:_gameId":
    to: "main"
    and: (gameId) ->
      log 'VIEWING PREVIEW STATE'
      #log preview
      if Session.equals('appState',undefined)
        Session.set('appState','preview')
      if Session.equals('activeTile',undefined)
        Session.set('activeTile',gameId)
  "/:_gameId/view":
    to: "main"
    and: (gameId) ->
      log 'VIEWING VIEW STATE'
      if Session.equals('appState',undefined)
        Session.set('appState','view')
      if Session.equals('activeTile',undefined)
        Session.set('activeTile',gameId)
  "/:_gameId/view/game":
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