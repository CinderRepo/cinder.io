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
  if Session.get('activeTile')
    Games.findOne(Session.get('activeTile'))
  else
    Games.findOne()

Template.nav.notification = ->
  if Session.equals('activeNotification',true) then true else false

Template.nav.notificationMessage = ->
  Games.findOne(Session.get('activeTile')).name

Template.nav.events
  'click .navButton':(e,t)->
    log 'afasfasf'
    e.stopImmediatePropagation()
    href = $(e.currentTarget).data('href')
    log href
    if href is 'close'
      Meteor.Router.to '/'
    else
      if Session.equals('modalState',href)
        Session.set('modalState',undefined)
      else
        Session.set('modalState',href)
  'click .gameSectionNav':(e,t)->
    log 'Clicking so tired'
    e.stopImmediatePropagation()
    href = $(e.currentTarget).data('href')
    Meteor.Router.to '/' + Session.get('activeTile') + '/' + href

Template.nav.preserve({
  '#nav'
  '#navWrapper'
})