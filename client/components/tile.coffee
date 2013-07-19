Template.tile.events
	'click .tile,
	click .tileInfoButton':(e,t)->
		e.stopImmediatePropagation()
		href = $(e.currentTarget).data('href')
		#Set the active game
		Session.set('activeTile',this._id)
    	#Go to the proper page
		Meteor.Router.to '/' + Session.get('activeTile') + '/' + href

Template.tile.preserve({
	'.tile'
	'.tileWrapper'
	'.tileInfo'
	'.tileInfoButton.left'
	'.tileInfoButton.right'
	'*[id]':(node)-> return node.id
})