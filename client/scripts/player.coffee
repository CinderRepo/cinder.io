#Template.player.events
  #"click .control":(e,t)->
    #log ".control clicked"
    #Session.set("playing",@.content._id)
    #if Session.equals("isPlaying",false)
    #  #log "Playing!"
    #  Session.set("isPlaying",true)
    #else
    #  #log "Pausing!"
    #  Session.set("isPlaying",false)
    #toggleOverlay()

    #type = @.content.type
    #log "type:",type

    #toggleMedia(type)
    #switch type
    #  when "game" then toggleGame()
    #  when "show" then toggleMedia()
    #  when "movie" then toggleMedia()
    #  when "song" then toggleMedia()

Template.player.preserve({
  "#player"
  "#media"
})