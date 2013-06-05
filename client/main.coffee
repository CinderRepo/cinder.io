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
  href: this._id + '/view'
  message: 'View'
  _id: this._id
Template.main.play = () ->
  state: 'play'
  href: this._id + '/view/play'
  message: 'Play'
  _id: this._id
Template.main.hasMessages = ->
  if Session.get('activeTile') and Session.equals('appState','view') and Games.findOne(Session.get('activeTile')).messages.length > 0 or
      Session.get('activeTile') and Session.equals('appState','play') and Games.findOne(Session.get('activeTile')).messages.length > 0
    true
  else
    false
Template.main.viewing = ->
  if Session.get('activeTile') and Session.equals('appState','preview') or
  Session.get('activeTile') and Session.equals('appState','view') or
  Session.get('activeTile') and Session.equals('appState','play')
    #User is viewing a game, show the game's page
    Games.findOne(Session.get('activeTile'))
  else if !Session.get('activeTile') and Session.equals('appState','browse')
    #User is viewing the browse page, show featured games
    Games.findOne({featured:true},{})
  else
    log 'Ruh Roh in Template.main.viewing'
Template.main.profileActive = ->
  if Session.get('activeTile') and Session.equals('appState','view') or Session.equals('appState','play') then true else false
Template.main.activeGame = ->
  Games.findOne(Session.get('activeTile'))
Template.main.preserve({
  '.paneWrapper'
  '.pane.profile'
  '.pane.browse'
  '#tiles'
  '.tileWrapper.expanded'
  '#gamePlayer'
  '#gamePlayerContent'
  '#messages'
})