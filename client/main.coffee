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
  Session.get('modalState')
Template.main.revealedDown = ->
  #if Session.get('revealedDown') then 'revealedDown' else ''
Template.main.revealedDownHeight = ->
  #Session.get('revealedDownHeight')
Template.main.preserve({
  '.paneWrapper'
  '.pane.profile'
  '.pane.browse'
  '#tiles'
  '.tileWrapper.expanded'
})