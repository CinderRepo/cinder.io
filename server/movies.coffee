Movies.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true

if Movies.find().count() == 0

  movies = [
    title: "Social Network"
    description: "You can't make 500 million friends without making a few enemies."
  ,
    title: "Limitless"
    description: "Picture a life without limits. Then go beyond it."

  ]

  timeStamp = (new Date()).getTime()

  _.each movies, (movieData)->
    movie = Movies.insert
      title: movieData.title
      description: movieData.description
      submitted: timeStamp

    timeStamp +=1

Meteor.publish "allMovies", ->
  Movies.find({},
    sort:
      submitted: -1
  )