Meteor.saveGame = (file, id) ->
  fileReader = new FileReader()
  fileReader.onload = (file) ->
    Meteor.call "saveGame", file.srcElement.result, id
  fileReader["readAsBinaryString"] file

window.onresize = ->
  #console.log "Resizing!"
  getWindowSize()
  #windowWidth = window.innerWidth
  #widthValue = windowWidth - 40
  #matrixValue = -(((400 * 100) / widthValue) - 100)

 ###SHIMS###
 window.requestAnimationFrame or (window.requestAnimationFrame = window.webkitRequestAnimationFrame or window.mozRequestAnimationFrame or window.oRequestAnimationFrame or window.msRequestAnimationFrame or (callback, element) ->
  window.setTimeout (->
    callback +new Date()
  ), 1000 / 60
)

@getWindowSize = () ->
  Session.set('windowWidth',window.innerWidth)
  Session.set('windowHeight',window.innerHeight)