Template.nav.viewing = ->
  if Session.get('activeTile')
    Games.findOne(Session.get('activeTile'))
  else
    Games.findOne()

Template.nav.notificationMessage = ->
  Games.findOne(Session.get('activeTile')).name

Template.nav.events
  'click .navButton':(e,t)->
    e.stopImmediatePropagation()
    href = $(e.currentTarget).data('href')
    log 'navButton clicked'
    if href is 'close'
      Meteor.Router.to '/'
    else
      if Session.equals('modalState',href)
        Session.set('modalState',undefined)
      else
        Session.set('modalState',href)
  'click .gameSectionNav':(e,t)->
    log 'gameSectionNav clicked'
    e.stopImmediatePropagation()
    href = $(e.currentTarget).data('href')
    Meteor.Router.to '/' + Session.get('activeTile') + '/' + href

Template.nav.preserve({
  '#nav'
  '#navWrapper'
})