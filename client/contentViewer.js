Template.contentViewer.helpers({
	currentGame: function() {
		console.log("Nope");
		return Games.findOne(Session.get('activeTile'));
	}
});