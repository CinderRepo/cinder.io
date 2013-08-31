#Publish Subscriptions
Meteor.publish 'games', ->
  Games.find {},
          sort:
            order: 1

#Publish additional user data to the client
Meteor.publish 'userData', ->
  Meteor.users.find
    _id: @userId
  ,
    fields:
      avatar: 1
      cinderFireInstalled: 1

if Games.find().count() is 0
	Games.insert
		name: 'Papers Please'
		genre: 'Simulation'
		description: 'Basic Starter Description'