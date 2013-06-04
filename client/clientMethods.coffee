Meteor.saveGame = (file, id) ->
  fileReader = new FileReader()
  fileReader.onload = (file) ->
    Meteor.call "saveGame", file.srcElement.result, id
  fileReader["readAsBinaryString"] file

@windowTimer = null
window.onresize = ->
  #console.log "Resizing!"
  getWindowSize()

###SHIMS###
window.requestAnimationFrame or (window.requestAnimationFrame = window.webkitRequestAnimationFrame or window.mozRequestAnimationFrame or window.oRequestAnimationFrame or window.msRequestAnimationFrame or (callback, element) ->
  window.setTimeout (->
    callback +new Date()
  ), 1000 / 60
)

@getWindowSize = () ->
  Session.set('windowWidth',window.innerWidth - 40) #Account for column padding and gutters
  Session.set('windowHeight',window.innerHeight)

  unless Session.get('columnCount') and Session.get('columnWidth')
    calculateColumnCount()
    calculateColumnWidth()