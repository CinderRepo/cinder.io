Template.rightSidebar.events
  'click .sidebarHeaderItemLink':(e,t)->
    log "sidebarHeaderItemLink clicked!"
    currentTarget = $(e.currentTarget)
    action = currentTarget.data("action")
    #Trigger it if it's an action
    if action is "logout"
      Meteor.logout()
      Session.set("loginFormActive",true)
    #Trigger form visiblity
    if action is "signupForm"
      Session.set("signupFormActive",true)
      Session.set("loginFormActive",false)
    if action is "loginForm"
      Session.set("signupFormActive",false)
      Session.set("loginFormActive",true)