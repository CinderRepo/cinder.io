Template.tile.rendered = () ->
	#Session.set('tileLoaded',false)
	initGrid()
	Session.set('tileLoaded',true)
	#log this.find('.tileWrapper')

Template.tile.helpers({
	width:() ->
		#log 'width helper'
		Session.get('columnWidth')
	x:()->
		#log 'x helper'
		#log this
		#log this._x
		Session.get('xPos')
		boop
	y:()->
		#log 'y helper'
		#log this._y
		Session.get('yPos')
	z:()->
		#log 'z helper'
		#log this._z
		Session.get('zPos')
})
Template.tile.view = ()->
	state: 'view'
	message: '>'
	_id: this._id
Template.tile.play = () ->
	state: 'play'
	message: 'Play'
	_id: this._id
Template.tile.expanded = ->
	if Session.equals('activeTile',this._id) and Session.equals('appState','preview') then 'preview' else if Session.equals('activeTile',this._id) and Session.equals('appState','view') then 'preview' else if Session.equals('activeTile',this._id) and Session.equals('appState','play') then 'preview' else ''
Template.tile.state = ->
	if Session.equals('activeTile',this._id) and Session.equals('appState','view') then 'expanded' else if Session.equals('appState','view') then 'hidden' else if Session.equals('activeTile',this._id) and Session.equals('appState','play') then 'hidden' else if Session.equals('appState','play') then 'hidden' else 'collapsed'
Template.tile.viewing = ->
	if Session.equals('activeTile',this._id) and Session.equals('appState','view') then Games.findOne({_id:Session.get('activeTile')},{}) else if Session.equals('activeTile',this._id) and Session.equals('appState','play') then Games.findOne({_id:Session.get('activeTile')},{}) else return
Template.tile.revealedDown = ->
	#if Session.equals('activeTile',this._id) then 'active' else ''
Template.tile.events
	'click .tile':(e,t)->
		log 'CLICKED TILE'
		e.stopImmediatePropagation()
		if Session.equals('appState','browse')
			#log 'First!'
			Meteor.Router.to '/' + $(e.currentTarget).data('href')
			Session.set('appState','preview')
			Session.set('activeTile',this._id)
		else
			#log 'Second'
			Meteor.Router.to '/'
			Session.set('activeTile',undefined)
			Session.set('appState','browse')
Template.tile.preserve({
	'.tileWrapper'
	'.tile'
	'*[id]':(node)-> return node.id
})