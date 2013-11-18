Session.setDefault("overlayHidden",false)
Session.setDefault("coverHidden",true)
Session.setDefault("isPlaying",false)
Session.setDefault("isVisualizing",false)

#XXX: Hacky, but it demonstrates the functionality, which is all I want right now.
#Make this reactive in short order.
$(window).on("keyup",(e)->
  #User held shift and ~
  if e.keyCode == 192
    if e.shiftKey
      e.preventDefault()
      toggleOverlay()
)

@toggleOverlay = () ->
  log "================================================="
  log "TOGGLEOVERLAY() CALLED"
  if Session.equals("overlayHidden",false)
    log "Hide! Hiding the overlay and resuming playback!"
    Session.set("overlayHidden",true)
    Session.set("isPlaying",true)
  else
    log "True! Showing the overlay and pausing playback!"
    Session.set("overlayHidden",false)
    Session.set("isPlaying",false)

@toggleCover = () ->
  if Session.equals("coverHidden",false)
    Session.set("coverHidden",true)
  else
    Session.set("coverHidden",false)

#Make it so that all textareas expand based on text content in the application
Template.layout.rendered = () ->
  log "=========================="
  log "LAYOUT RE-FUCKING RENDERED"
  textareas = $(this.findAll(".expanding"))
  textareas.expandingTextarea()
  Dropzone.autoDiscover = false
  #$(".topicSidebarInfo").stick_in_parent offset_top: 10
  #$(".topicTrayForm").stick_in_parent offset_top: 10

Template.layout.events
  "click .closeTopicTray":(e,t)->
    log "closeTopicTray"
    Session.set "topicTrayOpen",undefined
  "blur [data-name='price']":(e,t)->
    currentTarget = $(e.currentTarget)
    currentTarget.autoNumeric("init")
  "blur [contenteditable='true']":(e,t)->
    #Persist any changes the user has made to the appropriate collection.
    log "blurred!"
    self = this
    #log "self: ",self

    data = t.data
    log "data: ",data

    currentTarget = $(e.currentTarget)
    log "currentTarget: ",currentTarget

    type = currentTarget.data("type")
    log "type: ",type

    field = currentTarget.data("field")
    log "field: ",field

    contentInfoParam = _.capitalize Router.current().params['contentInfo']
    log "contentInfoParam: ",contentInfoParam

    modifier = $set: {}
    selector = field
    modifier.$set[selector] = currentTarget.html() or currentTarget.attr("value")

    #Strip all the HTML tags
    trimmedText = _.stripTags(currentTarget.html()) or _.stripTags(currentTarget.attr("value"))
    log "trimmedText: ",trimmedText

    if trimmedText.length != 0
      if type is "topic"
        window[contentInfoParam].update(
          _id: self._id
        ,
          modifier
        )
      else if type is "post"
        Posts.update(
          _id: self._id
        ,
          modifier
        )
    else
      log "No chars, we're onto you."
      currentTarget.text(self[field])
  "paste [contenteditable='true']":(e,t)->
    e.preventDefault()
    #Strips any rich text from the clipboard that's been copy pasted in, and only inserts plain text
    clipboard = (if e.clipboardData then e.clipboardData.getData("text/plain"))
    document.execCommand("inserttext",false,clipboard)
  "click [data-action='logout']":(e,t)->
    log "logout Clicked."
    Meteor.logout()
  "click [data-action='toggleCover']":(e,t)->
    log "toggleCover clicked!"
    currentTarget = $(e.currentTarget)
    log "action: ",currentTarget.data("action")
    log "cover: ",currentTarget.data("cover")
    cover = currentTarget.data("cover")
    #If there's a cover data-attribute, set the current cover to be that ID
    Session.set("cover",cover) if cover?
    toggleCover()
  "click [data-action='switchCover']":(e,t)->
    log "switchCover clicked!"
    currentTarget = $(e.currentTarget)
    log "cover: ",currentTarget.data("cover")
    cover = currentTarget.data("cover")
    Session.set("cover",cover) if cover?
  "click [data-action='toggleOverlay']":(e,t)->
    toggleOverlay()
  "click [data-action='play']":(e,t)->
    Session.set("playing",@._id)
    toggleOverlay()
  "click [data-action='toggleTopic']":(e,t)->
    self = this
    if Session.equals "topicOpen",self._id
      Session.set "topicOpen",undefined
    else
      Session.set "topicOpen",self._id
  "click [data-action='toggleFavorite']":(e,t)->
    #log ".toggle clicked!"
    self = this
    #log "self: ",self
    currentTarget = $(e.currentTarget)
    #log "currentTarget: ",currentTarget
    currentUser = Meteor.user()
    #log "currentUser: ",currentUser

    #Check to see if this is already in the user's favorites
    favorites = currentUser.profile.favorites
    #log "favorites: ",favorites

    favoriteExists = _.contains favorites, self._id
    #log "favoriteExists: ",favoriteExists

    if favoriteExists is true
      #log "Removing favorite from user"
      Meteor.users.update(
        _id: currentUser._id
      ,
        $pull:
          "profile.favorites": self._id
      ,
        (err,result)->
          if err
            log "err: ",err
          else
            log "result: ",result
      )
    else
      #log "Adding favorite to user"
      Meteor.users.update(
        _id: currentUser._id
      ,
        $addToSet:
          "profile.favorites": self._id
      ,
        (err,result)->
          if err
            log "err: ",err
          else
            log "result: ",result
      )
  "click [data-action='toggleFollow']":(e,t)->
    self = this
    currentTarget = $(e.currentTarget)
    currentUser = Meteor.user()

    #Check to see if this is already in the user's favorites
    following = currentUser.profile.following

    followingExists = _.contains following, self._id

    if followingExists is true
      Meteor.users.update(
        _id: currentUser._id
      ,
        $pull:
          "profile.following": self._id
      ,
        (err,result)->
          if err
            log "err: ",err
          else
            log "result: ",result
            #XXX: This is probably a bad practice, a user should not be able to update
            #another user's collection in any way. We'll have to fix this immediately
            #after launch. One of the highest priorities. More research required.
            Meteor.users.update(
              _id: self._id
            ,
              $pull:
                "profile.followers": currentUser._id
            ,
              (err,result)->
                if err
                  log "err: ",err
                else
                  log "result: ",result
            )
      )
    else
      Meteor.users.update(
        _id: currentUser._id
      ,
        $addToSet:
          "profile.following": self._id
      ,
        (err,result)->
          if err
            log "err: ",err
          else
            log "result: ",result
            #XXX: This is probably a bad practice, a user should not be able to update
            #another user's collection in any way. We'll have to fix this immediately
            #after launch. One of the highest priorities. More research required.
            Meteor.users.update(
              _id: self._id
            ,
              $addToSet:
                "profile.followers": currentUser._id
            ,
              (err,result)->
                if err
                  log "err: ",err
                else
                  log "result: ",result
            )
      )

Template.content.rendered = ->
  #We select from within the template instance because we only want to apply dropzone to this one context, and
  #still be reactive when a new context is created for the first time, without conflicting with other existing
  #dropzones.
  log "Content Rendered!"
  self = this
  log "self: ",self
  contentIcon = this.find(".contentIcon")
  #log "contentIcon: ",contentIcon
  unless !contentIcon
    dropzone = new Dropzone(contentIcon,
      url: "/"
      maxFilesize: 10
      thumbnailWidth: 80
      thumbnailHeight: 80
      previewTemplate:
        """<div class="preview file-preview">
            <div class="details">
              <div class="filename"><span data-dz-name></span></div>
              <div class="size" data-dz-size></div>
              <img data-dz-thumbnail />
            </div>
            <div class="progress"><span class="upload" data-dz-uploadprogress></span></div>
            <div class="success-mark"><span>✔</span></div>
            <div class="error-mark"><span>✘</span></div>
            <div class="error-message"><span data-dz-errormessage></span></div>
          </div>"""
    )

    dropzone.on("thumbnail",(file,dataURL)->
      log "Thumbnail generated!"
      Rewards.update
        _id: self.data._id
      ,
        $set:
          "rewardIcon":dataURL
      ,
        (err,result)->
          if err
            log "err: ",err
          else
            #Add the document ID to the current user
            log "result: ",result
    )

#XXX: This is a workaround for handlebars not being able to properly detect global data contexts when
#it is being called from within another nested data context. Ideally, we would have this within the router.
Template.topic.helpers
  topicPosts: ->
    #log "contentDetails helper called!"
    self = this
    #log "self: ",self
    Posts.find(parent: self._id)
  topicOpen: ->
    self = this
    openCount = 5
    #If there's more than 5 posts, collapse the topics for viewing convenience
    if self.posts.length > openCount
      #If the user has opened a topic, show the topics
      if Session.equals "topicOpen",self._id
        true
      else
        false
    #If there's less than 5 posts, just show them all
    else
      true

Template.topic.preserve(
  ".topicWrapper"
)

#XXX: This is a workaround for handlebars not being able to properly detect global data contexts when
#it is being called from within another nested data context. Ideally, we would have this within the router.
Template.leftSidebar.helpers
  favorites: ->
    user = Meteor.user()
    favorites = user.profile.favorites
    favoritesArray = []

    _.each favorites, (favoriteId) ->
      content = Content.findOne favoriteId
      #Push the content to the array for accessing the data on the
      #front end, if content for that favorited item was found.
      if content
        favoritesArray.push content
    favoritesArray
  following: ->
    user = Meteor.user()
    following = user.profile.following
    followingArray = []

    _.each following, (followingId) ->
      #log "followingId: ",followingId
      user = Meteor.users.findOne followingId
      #log "user: ",user
      #Push the content to the array for accessing the data on the
      #front end, if content for that favorited item was found.
      if user
        followingArray.push user
    #log "followingArray: ",followingArray
    followingArray