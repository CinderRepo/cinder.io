Community.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true

Meteor.publish "allCommunity", ->
  Community.find({}#,
    #sort:
      #submitted: -1
  )