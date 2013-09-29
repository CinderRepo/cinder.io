Router.map ->
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