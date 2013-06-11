Session.setDefault('previousTile',Games.findOne()) #Previous Tile
Session.setDefault('activeTile',Games.findOne()) #Active Tile
Session.setDefault('tilesLoadedCount',0) #In the beginning, we have 0 tiles available to us
Session.setDefault('tilesLoaded',false) #In the beginning, none of the tiles have been loaded yet
Session.setDefault('tileScrollPosition',0) #Current Position of the skip
Session.setDefault('rowCount',25) #The number of game rows to display in the list

Template.tile.rendered = () ->
	#Increment the tilesLoadedCount number if the tiles aren't ready yet
	if Session.get('tilesLoadedCount') < Session.get('rowCount') - 1 #We minus 1 because the tilesLoadedCount counts up from 0, whereas the rowCount counts up from 1. Silly, but there it is.
		#log 'DOM IS FUCKING READY!'
		Session.set('tilesLoadedCount',Session.get('tilesLoadedCount') + 1)
		#log Session.get('tilesLoadedCount')
	else
		#DOM is actually ready and the right number of tiles are now loaded
		#log 'DOM TILES IS FUCKING READY!!1'
		Session.set('tilesLoaded',true)
	#initGrid()
	#Session.set('tileLoaded',true)
Template.tile.events
	'click .tile':(e,t)->
		e.stopImmediatePropagation()
		if Session.equals('appState','browse') or !Session.equals('activeTile',this._id)
			Meteor.Router.to '/' + $(e.currentTarget).data('href')
			Session.set('activeTile',this._id)
			Session.set('appState','view')
		#else
		#	Meteor.Router.to '/'
		#	Session.set('activeTile',undefined)
		#	Session.set('appState','browse')

Template.tile.currentCursor = ->
	Games.findOne()
Template.tile.preserve({
	'.tileWrapper'
	'.tile'
	'*[id]':(node)-> return node.id
})