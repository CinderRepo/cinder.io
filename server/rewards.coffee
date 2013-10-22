Rewards.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true

Meteor.publish "allRewards", ->
  Rewards.find({}#,
    #sort:
      #submitted: -1
  )