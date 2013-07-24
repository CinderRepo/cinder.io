#Publish Subscriptions
Meteor.publish 'games', ->
  Games.find()

#Publish additional user data to the client
Meteor.publish 'userData', ->
  Meteor.users.find
    _id: @userId
  ,
    fields:
      avatar: 1
      cinderFireInstalled: 1