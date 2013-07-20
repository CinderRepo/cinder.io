Template.main.games = ->
  Games.find()
Template.main.messages = ->
  if Session.get('activeTile')
    Games.findOne(Session.get('activeTile')).messages
Template.main.viewing = ->
  if Session.get('activeTile')
    Games.findOne(Session.get('activeTile'))
  else
    Games.findOne()
Template.main.notificationMessage = ->
  Games.findOne(Session.get('activeTile')).name

Template.main.events
  'click #container':(e,t)->
    #Dismiss the modal when the user clicks outside of the navigation/modal
    e.stopImmediatePropagation()
    Session.set('oldModalState',Session.get('modalState'))
    Session.set('modalState',undefined)

Template.main.preserve({
  '#container'
  '#tiles'
  '#viewBg'
  '#view'
  '#profile'
  '#gamePlayer'
})