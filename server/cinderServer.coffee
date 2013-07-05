#Publish Subscriptions
Meteor.publish('games',()->
  Games.find()
)

#Basic Web Auth
###connect = Npm.require('connect');
  options =
    route: '',
    handle: connect.basicAuth (user, pass) ->
      user == 'cinder' and pass == 'makegreatproducts'
  __meteor_bootstrap__.app.stack.splice 0, 0, options###

#Populate User Database
Meteor.startup ->
  if Meteor.users.find().count() == 0
    Meteor.users.insert
      username: "Pieter"
      emails: ["pieterjparker@gmail.com"]
      name: "Pieter Parker"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Cinder")
    Meteor.users.insert
      username: "test"
      emails: ["test@example.com"]
      name: "John Doe"
      services:
        password:
          srp: Meteor._srp.generateVerifier("password")
    Meteor.users.insert
      username: "Jordan"
      emails: ["jordanranson@gmail.com"]
      name: "Jordan Ranson"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Kittycat")
    Meteor.users.insert
      username: "Nick"
      emails: ["nickbarth@live.com"]
      name: "Nick Barth"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Clarissa")
    Meteor.users.insert
      username: "Sarah"
      emails: ["sarah.wilson@gmail.com"]
      name: "Sarah Wilson"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Yardstick")
    Meteor.users.insert
      username: "Trevon"
      emails: ["trevon.romanuik@gmail.com"]
      name: "Trevon Romanuik"
      services:
        password:
          srp: Meteor._srp.generateVerifier("MassEffect")
    Meteor.users.insert
      username: "Jeremy"
      emails: ["jeremyaburns@gmail.com"]
      name: "Jeremy Burns"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Platformer")
    Meteor.users.insert
      username: "Sean"
      emails: ["sean.kopen@gmail.com"]
      name: "Sean Kopen"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Starcraft")
    Meteor.users.insert
      username: "David"
      emails: ["david.ravnsborg@gmail.com"]
      name: "David Ravnsborg"
      services:
        password:
          srp: Meteor._srp.generateVerifier("TheVoice")
    Meteor.users.insert
      username: "Jason"
      emails: ["jasongordonphillips@gmail.com"]
      name: "Jason Phillips"
      services:
        password:
          srp: Meteor._srp.generateVerifier("SalsaStud")
    Meteor.users.insert
      username: "Jed"
      emails: ["nyxojaele@hotmail.com"]
      name: "Jed Lang"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Starforge")
    Meteor.users.insert
      username: "Josh"
      emails: ["joshkyrzyk@gmail.com"]
      name: "Josh Kyrzyk"
      services:
        password:
          srp: Meteor._srp.generateVerifier("BetterLiving")
    Meteor.users.insert
      username: "Cody"
      emails: ["codyouimet@gmail.com"]
      name: "Cody Ouimet"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Craplock")
    Meteor.users.insert
      username: "Arvand"
      emails: ["aalviri@gmail.com"]
      name: "Arvand Alviri"
      services:
        password:
          srp: Meteor._srp.generateVerifier("JustPartying")
    Meteor.users.insert
      username: "Astrid"
      emails: ["astrid.rosemarin@gmail.com"]
      name: "Astrid Rosemarin"
      services:
        password:
          srp: Meteor._srp.generateVerifier("ASTEROID")
    Meteor.users.insert
      username: "Tyler"
      emails: ["tstemarie@gmail.com"]
      name: "Tyler Ste. Marie"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Uroboros")
    Meteor.users.insert
      username: "Gigi"
      emails: ["laugigi@live.com"]
      name: "Gigi Lau"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Zelda")
    Meteor.users.insert
      username: "Vicky"
      emails: ["lau_vicky@hotmail.com"]
      name: "Vicky Lau"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Camwhore")
    Meteor.users.insert
      username: "Cam"
      emails: ["cam@startupedmonton.com"]
      name: "Cam Linke"
      services:
        password:
          srp: Meteor._srp.generateVerifier("TouchMetric")
    Meteor.users.insert
      username: "Patrick"
      emails: ["patrick.crosman@gmail.com"]
      name: "Patrick Crosman"
      services:
        password:
          srp: Meteor._srp.generateVerifier("WindowsPhone7")
    Meteor.users.insert
      username: "Ken"
      emails: ["ken@startupedmonton.com"]
      name: "Ken Bautista"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Startups!")
    Meteor.users.insert
      username: "Sam"
      emails: ["samuel.t.irwin@gmail.com"]
      name: "Samuel Thomas Irwin"
      services:
        password:
          srp: Meteor._srp.generateVerifier("BiowareSucks")
    Meteor.users.insert
      username: "Hoke"
      emails: ["colder_space@hotmail.com"]
      name: "Hoke Chew"
      services:
        password:
          srp: Meteor._srp.generateVerifier("ChinookSucks")
    Meteor.users.insert
      username: "Ryan"
      emails: ["rpriebe@me.com"]
      name: "Ryan Priebe"
      services:
        password:
          srp: Meteor._srp.generateVerifier("QuitYourJob")
    Meteor.users.insert
      username: "Libby"
      emails: ["libby@startupedmonton.com"]
      name: "Libriel Padilla"
      services:
        password:
          srp: Meteor._srp.generateVerifier("OfficeSweetheart")
    Meteor.users.insert
      username: "Don"
      emails: ["don@getyardstick.com"]
      name: "Don Riep"
      services:
        password:
          srp: Meteor._srp.generateVerifier("YardstickingIt")

  if Games.find().count() == 0
    Games.insert
      name: "Sword and Sworcery"
      description: "Superbrothers: Sword & Sworcery EP is an exploratory action adventure videogame with an emphasis on audiovisual style. Traverse a mythic little realm, use a sword to do battle & evoke sworcery to solve mystical musical mysteries. Co-operate with friends via Twitter, experience a videogame world that is affected by moon phases & help a wandering warrior monk complete her woeful errand.
With Jim Guthrie's companion album available on vinyl & audiocassette, the project has been warmly received by audiences & critics, reaching more than a million people."
      genre: "Adventure"
      gameBy: "Superbrothers"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false