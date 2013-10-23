Commissions.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true

Meteor.publish "allCommissions", ->
  Commissions.find({}#,
    #sort:
      #submitted: -1
  )