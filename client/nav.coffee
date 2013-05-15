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
  message: 'x'

Template.nav.hidden = ->
  _id: Meteor.uuid()
  state: 'hidden'
  message: undefined

Template.nav.viewing = ->
  if Session.equals('appState','view') then true else false

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

#Template.nav.events
  #'click .dualButtons':(e,t) ->
    #log 'CLICKY'
    #log this._id
    #log e.currentTarget
    #log e.currentTarget.id
    #log e.currentTarget._id
    #log this
    #log 'Fuck'
    #log t.fuck
    #log 'CLICKED'
    #circleButtons = $(t.findAll('.circleButton'))
    #dualButtons = $(t.findAll('.dualButton'))
    #paneWrapper = $('.paneWrapper')
    #currentTarget = $(e.currentTarget)
    #log ':/'
    #log this
    #Session.set('activeCircleButton',this._id)
    #log circleButtons
    #log dualButtons
    #log currentTarget
    #log t.data
    #log currentTarget[0].data
    #log e.data
    #log this
    #log this.data
    #if Session.get('revealedDown')
      #Collapse the paneWrapper
    #  Session.set('activeModal',currentTarget.data('state'))
      #For some reason this has to be wrapped in a setTimeout otherwise it won't calculate the height properly.
      #Yes, I've hardcoded the heights. It's easier this way than trying to set up the proper calculations needed.
      #Our design is such that a modalForm shouldn't be more than 3 rows anyways, so this should be just fine.
      #Meteor.setTimeout(()->        
     #   if Session.get('inputThreePlaceholder') is undefined
          #log Session.get('inputThreePlaceholder')
          #log 'Two row'
          #If the modal is a two row layout
      #    Session.set('revealedDownHeight',220) #Height of Modal (200px) + Margin (20px)
      #    Session.set()
       # else
          #log Session.get('inputThreePlaceholder')
          #log 'Three row'
          #If the modal is a three row layout
        #  Session.set('revealedDownHeight',270) #Height of Modal (250px) + Margin (20px)
        #Session.set('revealedDown',true)
      #,0)
    #else
      #Set the active modal and expand the paneWrapper
     # Session.set('activeModal',currentTarget.data('state'))
      #For some reason this has to be wrapped in a setTimeout otherwise it won't calculate the height properly.
      #Yes, I've hardcoded the heights. It's easier this way than trying to set up the proper calculations needed.
      #Our design is such that a modalForm shouldn't be more than 3 rows anyways, so this should be just fine.
      #Meteor.setTimeout(()->
       # if Session.get('inputThreePlaceholder') is undefined
          #log Session.get('inputThreePlaceholder')
          #log 'Two row'
          #If the modal is a two row layout
        #  Session.set('revealedDownHeight',220) #Height of Modal (200px) + Margin (20px)
        #else
          #log Session.get('inputThreePlaceholder')
          #log 'Three row'
          #If the modal is a three row layout
         # Session.set('revealedDownHeight',270) #Height of Modal (250px) + Margin (20px)
        #Session.set('revealedDown',true)
      #,0)

  #'click .nav[data-state="loggedIn"] .dualsssButton':(e,t)->
    #log 'LOGGEDIN CLICKED'
    #currentTarget = $(e.currentTarget)
    #state = currentTarget.data('state')
    #Set the activePane
    #Session.set('activePane',state)
    #if state == 'profile'
      #log 'hurp'
      #Session.set('profileContext','userProfile')
      #if !Session.equals('profilePosition',0)
      #  Session.set('oldProfilePosition',Session.get('profilePosition'))
      #Session.set('profilePosition',0)
    #else if state == 'browse'
      #Session.set('profileContext','games')
      #Session.set('activeContentPane','preview')
      #Session.set('profilePosition',Session.get('oldProfilePosition'))

Template.nav.preserve({
  '.nav'
})