Template.tile.events
	'click .tile,
	click .tileInfoButton':(e,t)->
		log 'tileInfoButton clicked'
		e.stopImmediatePropagation()
		href = $(e.currentTarget).data('href')
		Session.set('activeTile',this._id)
		Meteor.Router.to '/' + Session.get('activeTile') + '/' + href

Template.tile.preserve({
	'.tile'
	'.tileWrapper'
	'.tileInfo'
	'.tileInfoButton.left'
	'.tileInfoButton.right'
	'*[id]':(node)-> return node.id
})