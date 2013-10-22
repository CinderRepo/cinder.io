Template.media.rendered = ->
  log "RERENDER!"
  #log "I EXIST IN THE DOM NOW!"
  #log "Session.get('isPlaying')",Session.get("isPlaying")
  #log "Session.get('playing')",Session.get("playing")
  #log "Session.get('overlayHidden')",Session.get("overlayHidden")
  #toggleOverlay()
  #log "Media Rendered!"
  #log "Session.get('overlayHidden'): ",Session.get("overlayHidden")
  media = $("#media")[0]
  if Session.equals("overlayHidden",false)
    log "Pausing Media!"
    media.pause()
  else
    log "Playing Media!"
    media.play()