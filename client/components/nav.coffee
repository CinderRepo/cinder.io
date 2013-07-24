Template.nav.events
  'click #nav':(e,t)->
    #This event only exists to prevent the container click event from firing when the user clicks on nav.
    e.stopImmediatePropagation()
    #log 'This event only exists to prevent the container click event from firing when the user clicks on nav.'
  'click .navButton':(e,t)->
    e.stopImmediatePropagation()
    href = e.currentTarget.getAttribute('data-href')
    if href is 'close'
      Meteor.Router.to '/'
    else if href is 'logout'
      Meteor.logout()
      Session.set('oldModalState',Session.get('modalState'))
      Session.set('modalState',undefined)
    else
      if Session.equals('modalState',href)
        Session.set('oldModalState',Session.get('modalState'))
        Session.set('modalState',undefined)
      else
        Session.set('oldModalState',Session.get('modalState'))
        Session.set('modalState',href)
  'click .gameSectionNav':(e,t)->
    e.stopImmediatePropagation()
    href = e.currentTarget.getAttribute('data-href')
    Meteor.Router.to '/' + Session.get('activeTile') + '/' + href

Template.nav.preserve({
  '#nav'
})