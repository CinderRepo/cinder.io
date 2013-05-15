Template.profile.profileContext = ->
	#if Session.equals('profileContext','games')
	#	Games.findOne({_id:Session.get('activeTile')},{})
	#else if Session.equals('profileContext','userProfile')
	#	Meteor.user()
Template.profile.games = ->
	#Session.equals('profileContext','games')
Template.profile.userProfile = ->
	#Session.equals('profileContext','userProfile')
Template.profile.profilePosition = ->
	#Session.get('profilePosition')
Template.profile.preserve({
	'.profile'
})