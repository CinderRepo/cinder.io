Template.main.games = ->
  Games.find()
Template.main.logout = ->
  state: 'logout'
  message: 'x'
Template.main.messages = ->
  if Session.get('activeTile')
    Games.findOne(Session.get('activeTile')).messages
Template.main.viewing = ->
  if Session.get('activeTile')
    Games.findOne(Session.get('activeTile'))
  else
    Games.findOne()

Template.main.preserve({
  '#container'
  '#tiles'
  '#viewBg'
  '#view'
  '#gamePlayer'
})