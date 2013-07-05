Template.main.games = ->
  Games.find()
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
  href: this._id + '/play'
  message: 'Play'
  _id: this._id
Template.main.notify = () ->
  state: 'notify'
Template.main.hasMessages = ->
  if Session.get('activeTile') and Session.equals('appState','view') and Games.findOne(Session.get('activeTile')).messages.length > 0 or
      Session.get('activeTile') and Session.equals('appState','play') and Games.findOne(Session.get('activeTile')).messages.length > 0
    true
  else
    false
Template.main.messages = ->
  if Session.get('activeTile')
    Games.findOne(Session.get('activeTile')).messages
Template.main.viewing = ->
  if Session.get('activeTile')
    Games.findOne(Session.get('activeTile'))
  else
    Games.findOne()
Template.main.scrollableList = () ->
  Games.find({}, {
    limit: Session.get('rowCount') * Session.get('columnCount') #Limit the games to the current rowCount number
    skip: Session.get('tileScrollPosition') * Session.get('rowCount') #Skip the right number of games
  })
Session.setDefault('activePane','info')
Template.main.activePane = ->
  Session.get('activePane')

Template.main.preserve({
  '#container'
  '#tiles'
  '#viewBg'
  '#view'
  '#gamePlayer'
  '#gamePlayerContent'
  '#messages'
})