@Persons = new Meteor.Collection2("persons",
  smart: true
  schema:
    _id:
      type: String
      optional: true

    username:
      type: String
      label: "Username"
      min: 3
      max: 30

    lastName:
      type: String
      label: "Last name"
      max: 30
      unique: true

  virtualFields:
    fullName: (person) ->
      person.username + " " + person.lastName
)

Persons.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true
  fetch: []

Persons.simpleSchema().messages
  minString: "[label] can't be less than [min] characters! Come on now!"
  notUnique: "Only one of each last name allowed"

if Meteor.isClient
  Meteor.subscribe "persons"
  Template.signupForm.helpers
    'users':->
      Meteor.users.find()

if Meteor.isServer
  Meteor.publish "persons", ->
    Persons.find()

#To lock down individual account.create calls, just validate user and verify it against schema.