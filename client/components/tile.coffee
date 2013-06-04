Template.tile.rendered = () ->
	initGrid()
	Session.set('tileLoaded',true)
Template.tile.events
	'click .tile':(e,t)->
		e.stopImmediatePropagation()
		if Session.equals('appState','browse') or !Session.equals('activeTile',this._id)
			Meteor.Router.to '/' + $(e.currentTarget).data('href')
			Session.set('appState','preview')
			Session.set('activeTile',this._id)
		else
			Meteor.Router.to '/'
			Session.set('activeTile',undefined)
			Session.set('appState','browse')
Template.tile.preserve({
	'.tileWrapper'
	'.tile'
	'*[id]':(node)-> return node.id
})