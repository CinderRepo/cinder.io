Router.map ->
<<<<<<< HEAD
  #HOME PAGE - We just show all content when the user first
  #visits, as they haven't specified any search terms yet.
  @route "home",
    path: "/"
    yieldTemplates:
      "home":
        to:
          "landing"
    data: ->
      #If a user is signed in, redirect to the content page
      if Meteor.user()
        #log "User found!"
        Router.go "filteredContent",
          type: "all"
      creations: Content.find({},{limit : 3})

  #FILTERED CONTENT - Shows filtered content based on the type the user passes in
  @route "filteredContent",
    path: "/:type"
    data: ->
      typeParam = @params.type
      #Create the correct collection selector based on the url param
      switch typeParam
        when "all" then type = "game"
        when "new" then type = "game"
        when "featured" then type = "game"
        else type = null

      if type is null
        content: Content.find()
        filteredContent: Content.find()
      else
        content: Content.find()
        filteredContent: Content.find
          type: type

  #CONTENT VIEW - Shows information about the currently selected content to the user
  @route "content",
    path: "/users/:owner/:context?/:contentInfo?"
    data: ->
      #Query for content data if viewing a type of content
      if @params.context and @params.contentInfo
        contentInfoParam = _.capitalize @params.contentInfo
        #log "contentInfoParam: ",contentInfoParam
        #Create the correct collection selector based on the url param
        content = Content.find()
        recommended = Content.find({},{limit : 3})
        playing = Content.findOne(_id: @params.context) || Content.findOne(_id: @params.owner)
        #log "content: ",content
        #contentInfo = window[contentInfoParam].find(parent: content._id)
        #log "contentInfo: ",contentInfo

        if @params.contentInfo is "about" or @params.contentInfo is "community"
          contentInfo = window[contentInfoParam].find(parent: content._id)
          #log "contentInfo: ",contentInfo
          #log "contentInfo.count(): ",contentInfo.count()
          #contentInfo

        ownerId = @params.owner
        log "ownerId: ",ownerId

        owner = Meteor.users.findOne(_id: ownerId)
        #log "owner: ",owner

        #favorites = owner.profile.favorites
        #log "favorites: ",favorites

        #favoritesArray = []

        #_.each favorites, (favoriteId) ->
        #  #log "favoriteId: ",favoriteId
        #  content = Content.findOne favoriteId
        #  #log "content: ",content
        #  if content
        #    favoritesArray.push content
        #  favoritesArray

        #log "favoritesArray: ",favoritesArray

        owner: Meteor.users.findOne(_id: ownerId)
        creations: Content.find(owner: ownerId)
        #favorites: favoritesArray
        content: content
        recommended: recommended
        playing: playing
        contentInfo: contentInfo
        #XXX: Eventually we'll want this to be included in the router, but since handlebars doesn't
        #allow for good switching of globally scoped data contexts when within other nested data contexts
        #we have to settle for using a template helper for now until there's a stable way to access parent data contexts.
        #contentDetails: Posts.find(parentSlug: @params.contentDetails) if @params.contentDetails?
=======
  @route "home",
    path: "/"

  @route "games",
    path: "/games"
    data: ->
      #log 'games!'
      games: Games.find()

  @route "viewGame",
    path: "/:gameOwnerSlug/:gameTitleSlug"
    data: ->
      currentGame = Games.findOne
        gameTitleSlug: @params.gameTitleSlug
      Session.set('currentGame',currentGame._id)
      game: currentGame

  @route "viewGameCommunity",
    path: "/:gameOwnerSlug/:gameTitleSlug/community"
    data: ->
      #log 'viewGameCommunity!'
      #log @params
      game: Games.findOne
        gameTitleSlug: @params.gameTitleSlug

  @route "viewGameCommunityThread",
    path: "/:gameOwnerSlug/:gameTitleSlug/community/:threadTitleSlug"
    data: ->
      #log 'viewGameCommunityThread!'
      #log @params
      game: Games.findOne
        gameTitleSlug: @params.gameTitleSlug

  @route "playGame",
    path: "/:gameOwnerSlug/:gameTitleSlug/play"
    data: ->
      #log 'playGame!'
      #log @params
      game: Games.findOne
        gameTitleSlug: @params.gameTitleSlug

  @route "fundGame",
    path: "/:gameOwnerSlug/:gameTitleSlug/fund"
    data: ->
      #log 'fundGame!'
      #log @params
      game: Games.findOne
        gameTitleSlug: @params.gameTitleSlug

  @route "remixGame",
    path: "/:gameOwnerSlug/:gameTitleSlug/remix"
    data: ->
      #log 'remixGame!'
      #log @params
      game: Games.findOne
        gameTitleSlug: @params.gameTitleSlug
>>>>>>> master
