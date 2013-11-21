About.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true

Meteor.publish "allAbout", ->
  About.find({}#,
    #sort:
      #submitted: -1
  )