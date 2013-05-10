Template.tile.revealedDown = ->
	if Session.equals('activeTile',this._id) then 'active' else ''
Template.tile.events
	'click .tile':(e,t)->
		log 'CLICKED TILE'
		if Session.equals('activeTile',this._id)
			Session.set('activeTile',undefined)
		else
			Session.set('activeTile',this._id)
	
		#Iterate through the tiles until we find the index of the one the user clicked
		#on, and use the index to calculate the position of the underlying profile.
		tiles = $('.tile')
		tiles.each((index)->
			if e.currentTarget is this
				log 'Boop!'
				#Calculate the profile position
				previewHeight = $('.tileWrapper').height()
				profilePosition = (previewHeight * (index+1))
				log profilePosition
				Session.set('profileContext','games')
				Session.set('profilePosition',profilePosition)
		)
Template.tile.preserve({
	'.tileWrapper'
	'.tile'
})