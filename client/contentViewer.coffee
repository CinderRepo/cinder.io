Template.contentViewer.helpers 
	currentGame: ->
		log "Nope"
		Games.findOne Session.get("activeTile")