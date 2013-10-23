Router.map ->
  #HOME PAGE - We just show all content when the user first
  #visits, as they haven't specified any search terms yet.
  @route "home",
    path: "/"
    template: "filteredContent" #We want the results to show up in the overlay, as we use that for main navigation, because we have a player that can't be interrupted just because the user is browsing.
    data: ->
      filteredContent: Content.find()

  #FILTERED CONTENT - Shows filtered content based on the type the user passes in
  @route "filteredContent",
    path: "/:type"
    data: ->
      typeParam = @params.type
      #Create the correct collection selector based on the url param
      switch typeParam
        when "games" then type = "game"
        when "songs" then type = "song"
        when "shorts" then type = "short"
        when "movies" then type = "movie"
        else type = null

      if type is null
        filteredContent: Content.find()
      else
        filteredContent: Content.find
          type: type

  #CONTENT VIEW - Shows information about the currently selected content to the user
  @route "content",
    path: "/users/:ownerSlug/:titleSlug?/:contentInfo?/:contentDetails?"
    data: ->
      #Query for content data if viewing a type of content
      if @.params.titleSlug and @params.contentInfo
        contentInfoParam = _.capitalize @params.contentInfo
        #Create the correct collection selector based on the url param
        content = Content.findOne(titleSlug: @params.titleSlug)
        #log "content: ",content
        contentInfo = window[contentInfoParam].find(parent: content._id)
        #log "contentInfo: ",contentInfo
        content: content
        contentInfo: contentInfo
        #XXX: Eventually we'll want this to be included in the router, but since handlebars doesn't
        #allow for good switching of globally scoped data contexts when within other nested data contexts
        #we have to settle for using a template helper for now until there's a stable way to access parent data contexts.
        #contentDetails: Posts.find(parentSlug: @params.contentDetails) if @params.contentDetails?
      else
        #log "Query for user if it's a user"
        #log "ownerSlug: ",@params.ownerSlug
        #Get the user name from the content via the ownerSlug
        owner = Content.findOne(ownerSlug: @params.ownerSlug).owner if owner?

        user: Meteor.users.findOne(ownerSlug: @params.ownerSlug)
        creations: Content.find(ownerSlug: @params.ownerSlug)

        #Find a user based on the ownerSlug
  #PROFILE VIEW - Shows information about the currently selected user to the user
  #@route "profile",
  #  path: "/users/:ownerSlug"
  #  template: "content"
  #  data: ->
  #    log "OWNER!"
  #    creations: Content.find(ownerSlug: @params.ownerSlug)