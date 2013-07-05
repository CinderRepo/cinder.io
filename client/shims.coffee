###SHIMS###
window.requestAnimationFrame or (window.requestAnimationFrame = window.webkitRequestAnimationFrame or window.mozRequestAnimationFrame or window.oRequestAnimationFrame or window.msRequestAnimationFrame or (callback, element) ->
  window.setTimeout (->
    callback +new Date()
  ), 1000 / 60
)