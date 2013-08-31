Router.configure
  layout: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'

  before: () ->
    log 'HELLO FROM BEFORE ROUTER!'

Router.map ->
  @route 'games',
    path: '/'
    template:
      'games':
        to: 'layout'
    data:
      games: () ->
        Games.find {},
          sort:
            order: 1
    waitOn: () ->
      Meteor.subscribe 'games', this.params._id
#Handle different application states
###Meteor.Router.add
  "/":
    to: "main"
    and: () ->
      #Keep track of the previous application state, if there is one
      Session.set('oldAppState',Session.get('appState'))
      Session.set('appState','browse')
      Session.set('activeTile',undefined)
  "/:_gameId/view":
    to: "main"
    and: (gameId) ->
      Session.set('oldAppState',Session.get('appState'))
      Session.set('appState','view')
      Session.set('activeTile',gameId)
      #Disable any open modals, if there are any
      if Session.get('modalState')
        Session.set('oldModalState',Session.get('modalState'))
        Session.set('modalState',undefined)
  "/:_userId/profile":
    to: "main"
    and: () ->
      Session.set('oldAppState',Session.get('appState'))
      Session.set('appState','profile')
      Session.set('activeTile',undefined)
      #Disable any open modals, if there are any
      if Session.get('modalState')
        Session.set('oldModalState',Session.get('modalState'))
        Session.set('modalState',undefined)
  "/create":
    to: "main"
    and: () ->
      Session.set('oldAppState',Session.get('appState'))
      Session.set('appState','create')
      Session.set('activeTile',undefined)
      #Disable any open modals, if there are any
      #if Session.get('modalState')
      #  Session.set('oldModalState',Session.get('modalState'))
      #  Session.set('modalState',undefined)
  "/:_gameId/play":
    to: "main"
    and: (gameId) ->
      Session.set('oldAppState',Session.get('appState'))
      Session.set('appState','play')
      Session.set('activeTile',gameId)
      if Meteor.user()
        GameSessions.insert({},{'userId':Meteor.user().username, 'gameId':Session.get('activeTile')})
      #Disable any open modals, if there are any
      if Session.get('modalState')
        Session.set('oldModalState',Session.get('modalState'))
        Session.set('modalState',undefined)
  "/:_gameId/community":
    to: "main"
    and: (gameId) ->
      Session.set('oldAppState',Session.get('appState'))
      Session.set('appState','community')
      Session.set('activeTile',gameId)
      #Disable any open modals, if there are any
      if Session.get('modalState')
        Session.set('oldModalState',Session.get('modalState'))
        Session.set('modalState',undefined)
  "/downloads/" + Session.get('currentOS') + "/fire.zip":
    to: "main"
    and: () ->
      path = Npm.require('path')
      fs = Npm.require('fs')
      file = '/downloads/' + Session.get('currentOS') + '/fire.zip'
      filename = path.basename(file)
      [200,
        'MIME-Type' : 'application/zip'
        'Content-Type' : 'application/x-unknown'
        'Content-Disposition' : 'attachment; filename=' + filename
      ,fs.readFileSync(file)]
      analytics.track 'User downloaded Cinder Fire'
  "*":
    to: "main"
    and: () ->
      analytics.track 'Error Page Encountered at ' + this.path###