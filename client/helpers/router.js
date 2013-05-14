Meteor.Router.add({
'/':{
	to: 'main',
	and: function() { console.log("main");}
	},

'/profile/:_id':{
	to: 'profile',
	and: function(id) { 
		console.log("router"); 
		Session.set('activeTile', id); 
		Session.set('profileContext','games'); 
		console.log(Session.get('activeTile')); }
}
});