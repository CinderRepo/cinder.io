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
  Games.findOne(Session.get('activeTile'))
Template.main.scrollableList = () ->
  Games.find({}, {
    limit: Session.get('rowCount') * Session.get('columnCount') #Limit the games to the current rowCount number
    skip: Session.get('tileScrollPosition') * Session.get('rowCount') #Skip the right number of games
  })

Template.main.events
  'mousewheel #container':(e,t)->
    #log e
    Session.set('scrollPosition',window.scrollY)
    #if Session.equals('appState','view')
      #e.stopImmediatePropagation()
      #e.preventDefault()
  ###'mousewheel #tiles':(e,t)->
    if e.wheelDeltaY < 0
      log 'SCROLLING UP!'
    else if e.wheelDeltaY > 0
      log 'SCROLLING DOWN!'
    else
      log 'Scrolling stopped?'###
  'webkitTransitionEnd #tilePage':(e,t)->
    e.stopImmediatePropagation()
    if Session.equals('appState','view')
      Session.set('disableScrolling',true)
    else
      Session.set('disableScrolling',false)
  'click #prev':(e,t)->
    newPosition = Session.get('tileScrollPosition') - 1
    if newPosition < 0 then Games.find().count() / Session.get('rowCount') #Wraparound
    Session.set('tileScrollPosition',newPosition)
  'click #next':(e,t)->
    newPosition = Session.get('tileScrollPosition') + 1
    if newPosition > Games.find().count() / Session.get('rowCount') then newPosition = 0 #Wraparound
    Session.set('tileScrollPosition', newPosition)

Template.main.preserve({
  '#container'
  '#tiles'
  '#tilePage'
  '#tilePageWrapper'
  '#gamePlayer'
  '#gamePlayerContent'
  '#messages'
})