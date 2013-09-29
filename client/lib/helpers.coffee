Handlebars.registerHelper "notification", (context, field) ->
  #log 'notification handlebars helper called'
  #log 'context:',context
  #log 'field:',field
  #notification =
  #  Notifications.findOne
  #    field: field

  #if notification
  #  notification.message