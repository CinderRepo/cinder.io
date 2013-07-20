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
      avatar: "/avatars/pieter/avatar.png"
      cinderFireInstalled: false
      services:
        password:
          srp: Meteor._srp.generateVerifier("Cinder")
    Meteor.users.insert
      username: "Kyle"
      emails: ["kyle@cinder.io"]
      name: "Kyle Richelhoff"
      avatar: "/avatars/kyle/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("JesseEisenberg")
    Meteor.users.insert
      username: "test"
      emails: ["test@example.com"]
      name: "John Doe"
      avatar: "/avatars/test/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("password")
    Meteor.users.insert
      username: "Jordan"
      emails: ["jordanranson@gmail.com"]
      name: "Jordan Ranson"
      avatar: "/avatars/jordan/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Kittycat")
    Meteor.users.insert
      username: "Nick"
      emails: ["nickbarth@live.com"]
      name: "Nick Barth"
      avatar: "/avatars/nick/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Clarissa")
    Meteor.users.insert
      username: "Sarah"
      emails: ["sarah.wilson@gmail.com"]
      name: "Sarah Wilson"
      avatar: "/avatars/sarah/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Yardstick")
    Meteor.users.insert
      username: "Trevon"
      emails: ["trevon.romanuik@gmail.com"]
      name: "Trevon Romanuik"
      avatar: "/avatars/trevon/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("MassEffect")
    Meteor.users.insert
      username: "Jeremy"
      emails: ["jeremyaburns@gmail.com"]
      name: "Jeremy Burns"
      avatar: "/avatars/jeremy/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Platformer")
    Meteor.users.insert
      username: "Sean"
      emails: ["sean.kopen@gmail.com"]
      name: "Sean Kopen"
      avatar: "/avatars/sean/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Starcraft")
    Meteor.users.insert
      username: "David"
      emails: ["david.ravnsborg@gmail.com"]
      name: "David Ravnsborg"
      avatar: "/avatars/david/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("TheVoice")
    Meteor.users.insert
      username: "Jason"
      emails: ["jasongordonphillips@gmail.com"]
      name: "Jason Phillips"
      avatar: "/avatars/jason/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("SalsaStud")
    Meteor.users.insert
      username: "Jed"
      emails: ["nyxojaele@hotmail.com"]
      name: "Jed Lang"
      avatar: "/avatars/jed/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Starforge")
    Meteor.users.insert
      username: "Josh"
      emails: ["joshkyrzyk@gmail.com"]
      name: "Josh Kyrzyk"
      avatar: "/avatars/josh/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("BetterLiving")
    Meteor.users.insert
      username: "Cody"
      emails: ["codyouimet@gmail.com"]
      name: "Cody Ouimet"
      avatar: "/avatars/cody/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Craplock")
    Meteor.users.insert
      username: "Arvand"
      emails: ["aalviri@gmail.com"]
      name: "Arvand Alviri"
      avatar: "/avatars/arvand/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("JustPartying")
    Meteor.users.insert
      username: "Astrid"
      emails: ["astrid.rosemarin@gmail.com"]
      name: "Astrid Rosemarin"
      avatar: "/avatars/astrid/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("ASTEROID")
    Meteor.users.insert
      username: "Tyler"
      emails: ["tstemarie@gmail.com"]
      name: "Tyler Ste. Marie"
      avatar: "/avatars/tyler/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Uroboros")
    Meteor.users.insert
      username: "Gigi"
      emails: ["laugigi@live.com"]
      name: "Gigi Lau"
      avatar: "/avatars/gigi/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Zelda")
    Meteor.users.insert
      username: "Vicky"
      emails: ["lau_vicky@hotmail.com"]
      name: "Vicky Lau"
      avatar: "/avatars/vicky/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Camwhore")
    Meteor.users.insert
      username: "Cam"
      emails: ["cam@startupedmonton.com"]
      name: "Cam Linke"
      avatar: "/avatars/cam/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("TouchMetric")
    Meteor.users.insert
      username: "Patrick"
      emails: ["patrick.crosman@gmail.com"]
      name: "Patrick Crosman"
      avatar: "/avatars/patrick/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("WindowsPhone7")
    Meteor.users.insert
      username: "Ken"
      emails: ["ken@startupedmonton.com"]
      name: "Ken Bautista"
      avatar: "/avatars/ken/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("Startups!")
    Meteor.users.insert
      username: "Sam"
      emails: ["samuel.t.irwin@gmail.com"]
      name: "Samuel Thomas Irwin"
      avatar: "/avatars/sam/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("BiowareSucks")
    Meteor.users.insert
      username: "Hoke"
      emails: ["colder_space@hotmail.com"]
      name: "Hoke Chew"
      avatar: "/avatars/hoke/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("ChinookSucks")
    Meteor.users.insert
      username: "Ryan"
      emails: ["rpriebe@me.com"]
      name: "Ryan Priebe"
      avatar: "/avatars/ryan/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("QuitYourJob")
    Meteor.users.insert
      username: "Libby"
      emails: ["libby@startupedmonton.com"]
      name: "Libriel Padilla"
      avatar: "/avatars/libby/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("OfficeSweetheart")
    Meteor.users.insert
      username: "Don"
      emails: ["don@getyardstick.com"]
      name: "Don Riep"
      avatar: "/avatars/don/avatar.png"
      services:
        password:
          srp: Meteor._srp.generateVerifier("YardstickingIt")

  if Games.find().count() == 0
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "BrowserQuest"
      description: "BrowserQuest is a game which draws a lot of inspiration from its old predecessors - most notably role-playing games from the 90's. This project is a tribute to those retro video-games which have amazed us and have forged our desire to build compelling and fun experiences in the first place."
      genre: "Adventure"
      gameBy: "Little Workshop"
      previewSrc: "/img/preview/sword-and-sworcery.png"
      viewBgSrc: "/img/viewBg/sword-and-sworcery-bg.png"
      #gameSrc: "http://games.cinder.io/51b8d7938f795e6b8200b4a1/index.html"
      gameSrc: "http://browserquest.mozilla.org/"
      messages: []
      active: true
      version: ''
      featured: false