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

  ###if Games.find().count() == 0
    Games.insert
      name: "Alan Wake's American Nightmare"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/alan-wakes-american-nightmare.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Alone in the Dark"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/alone-in-the-dark.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Amnesia the Dark Descent"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/amnesia-the-dark-descent.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "And Yet it Moves"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Puzzle"
      gameBy: "test"
      previewSrc: "/img/preview/and-yet-it-moves.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Bastion"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/bastion.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Batman Arkham Asylum"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/batman-arkham-asylum.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Batman Arkham City"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/batman-arkham-city.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Bioshock"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/bioshock.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Bioshock 2"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/bioshock-2.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Bioshock Infinite"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/bioshock-infinite.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: true
    Games.insert
      name: "Bit Trip Runner"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Platformer"
      gameBy: "test"
      previewSrc: "/img/preview/bit-trip-runner.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Borderlands 2"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/borderlands-2.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Braid"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Platformer"
      gameBy: "test"
      previewSrc: "/img/preview/braid.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Brutal Legend"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/brutal-legend.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Catherine"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/catherine.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Cave Story Plus"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Platformer"
      gameBy: "test"
      previewSrc: "/img/preview/cave-story-plus.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Cogs"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Puzzle"
      gameBy: "test"
      previewSrc: "/img/preview/cogs.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Counter Strike Source"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/counter-strike-source.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Crayon Physics Deluxe"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Puzzle"
      gameBy: "test"
      previewSrc: "/img/preview/crayon-physics-deluxe.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Dark Souls"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/dark-souls.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Dark Void"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/dark-void.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Darksiders I"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/darksiders-i.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Darksiders II"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/darksiders-ii.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Day of Defeat Source"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/day-of-defeat-source.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Dead Island"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/dead-island.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Deadly Premonition"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/deadly-premonition.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Demon's Souls"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/demons-souls.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Devil May Cry One"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/devil-may-cry-1.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Devil May Cry Two"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/devil-may-cry-2.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Devil May Cry Three"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/devil-may-cry-3.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Devil May Cry Four"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/devil-may-cry-4.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Devil may Cry Five"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/devil-may-cry-5.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Digital Devil Saga"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/digital-devil-saga.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Disgaea"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/disgaea.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Dungeon Defenders"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Strategy"
      gameBy: "test"
      previewSrc: "/img/preview/dungeon-defenders.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Eternal Sonata"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/eternal-sonata.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy Crystal Chronicles"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-crystal-chronicles.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy I"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-i.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy II"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-ii.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy III"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-iii.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy IV"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-iv.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy V"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-v.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy VI"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-vi.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy VII"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-vii.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy VIII"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-viii.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy IX"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-ix.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy X"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-x.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy X-2"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-x-2.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy XI"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-xi.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy XII"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-xii.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy XIII"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-xiii.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy XIV"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-xiv.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Folklore"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/folklore.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Garry's Mod"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Simulation"
      gameBy: "test"
      previewSrc: "/img/preview/garrys-mod.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Gotham City Imposters"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/gotham-city-imposters.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Gratuitious Space Battles"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/gratuitous-space-battles.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Half Life 2"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/half-life-2.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Half Life 2 Episode One"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/half-life-2-episode-one.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Half Life 2 Episode Two"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/half-life-2-episode-two.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Harvest Moon Magical Melody"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Simulation"
      gameBy: "test"
      previewSrc: "/img/preview/harvest-moon-magical-melody.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Hitman Blood Money"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/hitman-blood-money.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Hitman Contracts"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/hitman-contracts.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Hitman Codename 47"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/hitman-codename-47.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Hitman 2 Silent Assassin"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/hitman-2-silent-assassin.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Hitman Absolution"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/hitman-absolution.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Just Cause 2"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/just-cause-2.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Killing Floor"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/killing-floor.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Kingdom Hearts"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/kingdom-hearts-1.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Kingdom Hearts 2"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/kingdom-hearts-2.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "L.A. Noire"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/la-noire.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Left 4 Dead"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/left-4-dead.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Left 4 Dead 2"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/left-4-dead-2.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Legend of Grimrock"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/legend-of-grimrock.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Limbo"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Platformer"
      gameBy: "test"
      previewSrc: "/img/preview/limbo.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Lone Survivor"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Platformer"
      gameBy: "test"
      previewSrc: "/img/preview/lone-survivor.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Lost Odyssey"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/lost-odyssey.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Machinarium"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Puzzle"
      gameBy: "test"
      previewSrc: "/img/preview/machinarium.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Magicka"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/magicka.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Metal Gear Solid: The Twin Snakes"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/metal-gear-solid-the-twin-snakes.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Metal Gear Solid 2: Sons of Liberty"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/metal-gear-solid-2-sons-of-liberty.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Metal Gear Solid 3: Snake Eater"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/metal-gear-solid-3-snake-eater.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Metal Gear Solid 4: Guns of the Patriots"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/metal-gear-solid-4-guns-of-the-patriots.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Metal Gear Rising Revengeance"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/metal-gear-rising-revengeance.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Might and Magic: Clash of Heroes"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/might-and-magic-clash-of-heroes.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Minecraft"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/minecraft.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Mini Ninjas"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/mini-ninjas.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Mirrors Edge"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/mirrors-edge.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Mount and Blade"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Massively Multiplayer"
      gameBy: "test"
      previewSrc: "/img/preview/mount-and-blade.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Mount and Blade: Warband"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Massively Multiplayer"
      gameBy: "test"
      previewSrc: "/img/preview/mount-and-blade-warband.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Mount and Blade: With Fire and Sword"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Massively Multiplayer"
      gameBy: "test"
      previewSrc: "/img/preview/mount-and-blade-with-fire-and-sword.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Nier"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/nier.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Okami"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/okami.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Paper Mario"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/paper-mario.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Paper Mario: The Thousand Year Door"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/paper-mario-the-thousand-year-door.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Portal"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Puzzle"
      gameBy: "test"
      previewSrc: "/img/preview/portal.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Portal 2"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Puzzle"
      gameBy: "test"
      previewSrc: "/img/preview/portal-2.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Prince of Persia: The Forgotten Sands"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/prince-of-persia-the-forgotten-sands.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Prince of Persia: Warrior Within"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/prince-of-persia-warrior-within.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Prince of Persia: The Two Thrones"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/prince-of-persia-the-two-thrones.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Prince of Persia"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/prince-of-persia.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Psychonauts"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/psychonauts.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Shank"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/shank.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Sid Meier's Civilization V"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Strategy"
      gameBy: "test"
      previewSrc: "/img/preview/sid-meiers-civilization-v.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Silent Hill HD Collection"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/silent-hill-hd-collection.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Skyrim"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/skyrim.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Sonic Generations"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Platformer"
      gameBy: "test"
      previewSrc: "/img/preview/sonic-generations.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Spec Ops the Line"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/spec-ops-the-line.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Spiral Knights"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Free to Play"
      gameBy: "test"
      previewSrc: "/img/preview/spiral-knights.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Star Ocean: The Last Hope"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/star-ocean-the-last-hope.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Star Wars Jedi Knight II: Jedi Outcast"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/star-wars-jedi-knight-ii-jedi-outcast.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Star Wars: Knights of the Old Republic"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/star-wars-knights-of-the-old-republic.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Super Meat Boy"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Platformer"
      gameBy: "test"
      previewSrc: "/img/preview/super-meat-boy.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Super Paper Mario"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/super-paper-mario.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Superbrothers: Sword and Sworcery"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/superbrothers-sword-and-sworcery-ep.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Abyss"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-abyss.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Destiny"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-destiny.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Destiny II"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-destiny-ii.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Eternia"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-eternia.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Graces"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-graces.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Hearts"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-hearts.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Innocence"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-innocence.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Legendia"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-legendia.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Phantasia"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-phantasia.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Rebirth"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-rebirth.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Symphonia"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-symphonia.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Symphonia: Dawn of the New World"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-symphonia-dawn-of-the-new-world.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Vesperia"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-vesperia.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Xillia"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-xillia.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Team Fortress 2"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Free to Play"
      gameBy: "test"
      previewSrc: "/img/preview/team-fortress-2.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Darkness"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/the-darkness.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Darkness II"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/the-darkness-ii.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Legend of Zelda: Ocarina of Time"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/the-legend-of-zelda-ocarina-of-time.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Legend of Zelda: Majora's Mask"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/the-legend-of-zelda-majoras-mask.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Legend of Zelda: The Wind Waker"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/the-legend-of-zelda-wind-waker.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Legend of Zelda: Twilight Princess"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/the-legend-of-zelda-twilight-princess.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Legend of Zelda: Skyward Sword"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/the-legend-of-zelda-skyward-sword.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Witcher"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/the-witcher-i.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Witcher II"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/the-witcher-ii.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tomb Raider"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/tomb-raider.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Torchlight"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/torchlight.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Torchlight 2"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/torchlight-2.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Trine"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Platformer"
      gameBy: "test"
      previewSrc: "/img/preview/trine.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Trine 2"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Platformer"
      gameBy: "test"
      previewSrc: "/img/preview/trine-2.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Valkyria Chronicles"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Strategy"
      gameBy: "test"
      previewSrc: "/img/preview/valkyria-chronicles.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "VVVVVV"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Platformer"
      gameBy: "test"
      previewSrc: "/img/preview/vvvvvv.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Warhammer 40k: Space Marine"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/warhammer-40k-space-marine.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Wet"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/wet.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "White Knight Chronicles"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/white-knight-chronicles.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Year Walk"
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/year-walk.jpg"
      gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      messages: []
      active: true
      version: ''
      featured: false###