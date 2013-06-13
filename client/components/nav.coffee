Template.nav.settings = ->
  _id: Meteor.uuid()
  state: 'settings'
  message: 's'

Template.nav.logout = ->
  _id: Meteor.uuid()
  state: 'logout'
  message: 'L'

Template.nav.add = ->
  _id: Meteor.uuid()
  state: 'add'
  message: '+'

Template.nav.exit = ->
  _id: Meteor.uuid()
  state: 'exit'
  href: ''
  message: '<'

Template.nav.hidden = ->
  _id: Meteor.uuid()
  state: 'hidden'
  message: undefined

Template.nav.yes = ->
  _id: Meteor.uuid()
  state: 'yes'
  message: 'y'

Template.nav.no = ->
  _id: Meteor.uuid()
  state: 'no'
  message: 'n'

Template.nav.feedback = ->
  _id: Meteor.uuid()
  state: 'feedback'
  message: 'f'

Template.nav.playing = ->
  if Session.equals('appState','play') then true else false

Template.nav.viewing = ->
  if Session.equals('appState','view') then true else false

Template.nav.notification = ->
  if Session.equals('activeNotification',true) then true else false

Template.nav.notificationMessage = ->
  Games.findOne(Session.get('activeTile')).name

Template.nav.loggedOut = ->
  _buttonLeftId: Meteor.uuid()
  buttonLeftState: 'login'
  buttonLeftText: 'Login'
  buttonMiddle: 'c'
  _buttonRightId: Meteor.uuid()
  buttonRightState: 'signup'
  buttonRightText: 'Sign Up'

Template.nav.loggedIn = ->
  _buttonLeftId: Meteor.uuid()
  buttonLeftState: 'profile'
  buttonLeftText: Meteor.user() and Meteor.user().username
  buttonMiddle: 'u'
  _buttonRightId: Meteor.uuid()
  buttonRightState: 'browse'
  buttonRightText: 'Browse'

Template.nav.exitGame = ->
  _buttonLeftId: Meteor.uuid()
  buttonLeftState: 'exitGame'
  buttonLeftText: 'Exit Game'
  buttonLeftHref: Session.get('activeTile')
  buttonMiddle: 'u'
  _buttonRightId: Meteor.uuid()
  buttonRightState: 'browse'
  buttonRightText: 'Browse'

Template.nav.events
  'click .navScrollerItem':(e,t)->
    log 'navScrollerItem clicked!'
    #Set the activePane session
    Session.set('activePane',$(e.currentTarget).data('pane'))
    if $(e.currentTarget).data('pane') == 'play'
      Meteor.Router.to '/' + Session.get('activeTile') + '/play'
    else
      Meteor.Router.to '/' + Session.get('activeTile')

Template.nav.preserve({
  '#nav'
  '#navWrapper'
  '#navScrollerWrapper'
  '.circleButton[data-state="feedback"]'
  '.circleButton[data-state="exit"]'
})