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
  log "contentInfo Rendered"
  textareas = $(this.findAll(".expanding"))
  textareas.expandingTextarea()
  Dropzone.autoDiscover = false
  $(".topicSidebarInfo").stick_in_parent offset_top: 10

Template.layout.events
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
  "click .toggle":(e,t)->
    log ".toggle clicked!"

Template.topic.rendered = ->
  #We select from within the template instance because we only want to apply dropzone to this one context, and
  #still be reactive when a new context is created for the first time, without conflicting with other existing
  #dropzones.
  self = this
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
    log "contentDetails helper called!"
    self = this
    #log "self: ",self
    Posts.find(parent: self._id)