Updates.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true

Meteor.publish "allUpdates", ->
  Updates.find({}#,
    #sort:
      #submitted: -1
  )