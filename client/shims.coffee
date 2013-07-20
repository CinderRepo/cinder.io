###SHIMS###
window.requestAnimationFrame or (window.requestAnimationFrame = window.webkitRequestAnimationFrame or window.mozRequestAnimationFrame or window.oRequestAnimationFrame or window.msRequestAnimationFrame or (callback, element) ->
  window.setTimeout (->
    callback +new Date()
  ), 1000 / 60
)

###PAGE VISIBILITY API - HIDDEN PROPERTY###
@getHiddenProp = ->
  prefixes = ["webkit", "moz", "ms", "o"]
  #if 'hidden' is natively supported just return it
  return "hidden"  if "hidden" of document
  #otherwise loop over all the known prefixes until we find one
  i = 0
  while i < prefixes.length
    return prefixes[i] + "Hidden"  if (prefixes[i] + "Hidden") of document
    i++
  #otherwise it's not supported
  null
@isHidden = ->
  prop = getHiddenProp()
  return false  unless prop
  document[prop]

###PAGE VISIBILITY API - VISIBLITY STATE PROPERTY###
@getVisibilityStateProp = ->
  prefixes = ["webkit", "moz", "ms", "o"]
  #if 'hidden' is natively supported just return it
  return "visibilityState"  if "visibilityState" of document
  #otherwise loop over all the known prefixes until we find one
  i = 0
  while i < prefixes.length
    return prefixes[i] + "VisibilityState"  if (prefixes[i] + "VisibilityState") of document
    i++
  #otherwise it's not supported
  null

###DETECT A TAB'S STATE###
@getTabState = ->
  prop = getVisibilityStateProp()
  return false  unless prop
  document[prop]