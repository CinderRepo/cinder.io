@windowTimer = null
window.onresize = ->
  getWindowSize()

@getWindowSize = () ->
  Session.set('windowWidth',window.innerWidth)
  Session.set('windowHeight',window.innerHeight)