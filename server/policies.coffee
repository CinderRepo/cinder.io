#log "BROWSER POLICY: ",BrowserPolicy
#Meteor.startup(()->
#  BrowserPolicy.content.disallowInlineScripts()
#  BrowserPolicy.content.allowOriginForAll()
#  BrowserPolicy.framing.allowAll()
#  BrowserPolicy.framing.restrictToOrigin("http://games.cinder.io")
#)