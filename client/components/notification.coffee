Template.notification.events
  'click .notificationButton':(e,t)->
    log 'notificationButton clicked'
    e.stopImmediatePropagation()
    href = $(e.currentTarget).data('href')
    #If the user selects yes, reload the gamePlayer window.
    if href is 'yes'
      #This needs to switch to a better method to avoid cross-origin issues.
      $('#gamePlayer')[0].contentWindow.location.reload(true)
      $('#gamePlayer').attr('src',$('#gamePlayer').attr('src'))
      Session.set('notificationActive',false)
    else
      Session.set('notificationActive',false)

Template.notification.preserve({
  '.notification'
})