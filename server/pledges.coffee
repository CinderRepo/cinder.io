Pledges.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true

Meteor.publish "allPledges", ->
  Pledges.find({}#,
    #sort:
      #submitted: -1
  )