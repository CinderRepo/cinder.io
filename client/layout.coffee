Template.layout.messages = ->
  if Session.get('activeTile')
    Games.findOne(Session.get('activeTile')).messages
Template.layout.notificationMessage = ->
  Games.findOne(Session.get('activeTile')).name

Template.layout.events
  'click #container':(e,t)->
    #Dismiss the modal when the user clicks outside of the navigation/modal
    e.stopImmediatePropagation()
    Session.set('oldModalState',Session.get('modalState'))
    Session.set('modalState',undefined)

Template.layout.preserve({
  '#container'
  '#tiles'
  '#viewBg'
  '#view'
  '#profile'
  '#gamePlayer'
})