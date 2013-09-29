Shows.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true

if Shows.find().count() == 0

  shows = [
    title: "The One With The Soup Nazi"
    description: "Jerry tries to order soup. Hilarity ensues."
  ,
    title: "The Banana Stand"
    description: "There is always money in the Banana Stand."

  ]

  timeStamp = (new Date()).getTime()

  _.each shows, (showData)->
    show = Shows.insert
      title: showData.title
      description: showData.description
      submitted: timeStamp

    timeStamp +=1

Meteor.publish "allShows", ->
  Shows.find({},
    sort:
      submitted: -1
  )