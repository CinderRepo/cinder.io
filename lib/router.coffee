Router.map ->
  @route "home",
    path: "/"
    data: ->
      content: Content.find()
      featured: Content.findOne
        featured: true

  #GAMES FILTER
  @route "games",
    path: "/games"
    data: ->
      games: Content.find
        type: 'game'
      featured: Content.findOne
        featured: true
        type: 'game'

  #MOVIE SPECIFIC ROUTES
  @route "movies",
    path: "/movies"
    data: ->
      movies: Content.find
        type: 'movie'
      featured: Content.findOne
        featured: true
        type: 'movie'

  #SHOW SPECIFIC ROUTES
  @route "shows",
    path: "/shows"
    data: ->
      shows: Content.find
        type: 'show'
      featured: Content.findOne
        featured: true
        type: 'show'

  #PROFILE ROUTE
  ###@route "viewContent",
    path: "/:ownerSlug"
    data: ->
      contentOwner = Content.findOne
        ownerSlug: @params.ownerSlug
      contentOwnerUserId = Meteor.users.findOne

      Session.set('currentContent',contentOwner._id)
      currentContent: contentOwner###

  #CONTENT ROUTE
  @route "viewContent",
    path: "/:ownerSlug/:titleSlug"
    data: ->
      currentContent = Content.findOne
        titleSlug: @params.titleSlug
      Session.set('currentContent',currentContent._id)
      currentContent: currentContent