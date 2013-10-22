Posts.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true

Meteor.publish "allPosts", ->
  Posts.find({}#,
    #sort:
      #submitted: -1
  )