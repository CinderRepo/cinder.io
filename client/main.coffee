Template.main.games = ->
  Games.find()
Template.main.loggedOut = ->
  state: 'loggedOut'
  buttonLeftState: 'login'
  buttonLeftText: 'Login'
  buttonMiddle: 'c'
  buttonRightState: 'signUp'
  buttonRightText: 'lolwut?'
Template.main.loggedIn = ->
  state: 'loggedIn'
  buttonLeftState: 'viewProfile'
  buttonLeftText: Meteor.user().username
  buttonMiddle: 'u'
  buttonRightState: 'browseGames'
  buttonRightText: 'lolwut?'
Template.main.logout = ->
  state: 'logout'
  message: 'x'
Template.main.add = ->
  state: 'add'
  message: '+'
Template.main.state = ->
  Session.get('appState')
Template.main.modalState = ->
  Session.get('modalState')
Template.main.view = ()->
  state: 'view'
  href: Session.get('activeTile') + '/view'
  message: 'View'
  _id: this._id
Template.main.play = () ->
  state: 'play'
  href: Session.get('activeTile') + '/play'
  message: 'Play'
  _id: this._id
#Template.main.activeGame = ->
#  Games.findOne({_id:Session.get('activeTile')},{})
Template.main.viewing = ->
  if Session.get('activeTile') and Session.equals('appState','preview') or
  Session.get('activeTile') and Session.equals('appState','view')
    #User is viewing a game, show the game's page
    Games.findOne({_id:Session.get('activeTile')},{})
  else
    #User is viewing the browse page, show featured games
    Games.findOne({featured:true},{})
    #Session.set('activeTile',featuredGame._id)
Template.main.preserve({
  '.paneWrapper'
  '.pane.profile'
  '.pane.browse'
  '#tiles'
  '.tileWrapper.expanded'
  '#gamePlayer'
  '#gamePlayerContent'
})