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

  ###if Games.find().count() == 0
    Games.insert
      name: "Alan Wake's American Nightmare"
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/alan-wakes-american-nightmare.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Alone in the Dark"
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/alone-in-the-dark.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Amnesia the Dark Descent"
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/amnesia-the-dark-descent.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "And Yet it Moves"
      genre: "Puzzle"
      gameBy: "test"
      previewSrc: "/img/preview/and-yet-it-moves.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Bastion"
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/bastion.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Batman Arkham Asylum"
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/batman-arkham-asylum.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Batman Arkham City"
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/batman-arkham-city.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Bioshock"
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/bioshock.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Bioshock 2"
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/bioshock-2.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Bioshock Infinite"
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/bioshock-infinite.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: true
    Games.insert
      name: "Bit Trip Runner"
      genre: "Platformer"
      gameBy: "test"
      previewSrc: "/img/preview/bit-trip-runner.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Borderlands 2"
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/borderlands-2.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Braid"
      genre: "Platformer"
      gameBy: "test"
      previewSrc: "/img/preview/braid.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Brutal Legend"
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/brutal-legend.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Catherine"
      genre: "Role Playing"
      gameBy: "test"
      previewSrc: "/img/preview/catherine.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Cave Story Plus"
      genre: "Platformer"
      gameBy: "test"
      previewSrc: "/img/preview/cave-story-plus.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Cogs"
      genre: "Puzzle"
      gameBy: "test"
      previewSrc: "/img/preview/cogs.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Counter Strike Source"
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/counter-strike-source.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Crayon Physics Deluxe"
      genre: "Puzzle"
      gameBy: "test"
      previewSrc: "/img/preview/crayon-physics-deluxe.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Dark Souls"
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/dark-souls.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Dark Void"
      genre: "Shooter"
      gameBy: "Action"
      previewSrc: "/img/preview/dark-void.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Darksiders I"
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/darksiders-i.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Darksiders II"
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/darksiders-ii.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Day of Defeat Source"
      genre: "Action"
      gameBy: "test"
      previewSrc: "/img/preview/day-of-defeat-source.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Dead Island"
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/dead-island.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Deadly Premonition"
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/deadly-premonition.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Demon's Souls"
      genre: "Adventure"
      gameBy: "test"
      previewSrc: "/img/preview/demons-souls.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    ###Games.insert
      name: "Devil May Cry One"
      genre: "RPG"
      gameBy: "test"
      previewSrc: "/img/preview/devil-may-cry-1.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Devil May Cry Two"
      genre: "Sim"
      gameBy: "test"
      previewSrc: "/img/preview/devil-may-cry-2.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Devil May Cry Three"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/devil-may-cry-3.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Devil May Cry Four"
      genre: "RPG"
      gameBy: "test"
      previewSrc: "/img/preview/devil-may-cry-4.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Devil may Cry Five"
      genre: "Sim"
      gameBy: "test"
      previewSrc: "/img/preview/devil-may-cry-5.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Digital Devil Saga"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/digital-devil-saga.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Disgaea"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/disgaea.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Dungeon Defenders"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/dungeon-defenders.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Eternal Sonata"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/eternal-sonata.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy Crystal Chronicles"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-crystal-chronicles.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy I"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-i.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy II"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-ii.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy III"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-iii.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy IV"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-iv.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy V"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-v.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy VI"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-vi.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy VII"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-vii.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy VIII"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-viii.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy IX"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-ix.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy X"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-x.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy X-2"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-x-2.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy XI"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-xi.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy XII"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-xii.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy XIII"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-xiii.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Final Fantasy XIV"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/final-fantasy-xiv.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Folklore"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/folklore.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Garry's Mod"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/garrys-mod.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Gotham City Imposters"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/gotham-city-imposters.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Gratuitious Space Battles"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/gratuitous-space-battles.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Half Life 2"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/half-life-2.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Half Life 2 Episode One"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/half-life-2-episode-one.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Half Life 2 Episode Two"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/half-life-2-episode-two.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Harvest Moon Magical Melody"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/harvest-moon-magical-melody.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Hitman Blood Money"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/hitman-blood-money.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Hitman Contracts"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/hitman-contracts.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Hitman Codename 47"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/hitman-codename-47.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Hitman 2 Silent Assassin"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/hitman-2-silent-assassin.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Hitman Absolution"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/hitman-absolution.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Just Cause 2"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/just-cause-2.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Killing Floor"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/killing-floor.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Kingdom Hearts"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/kingdom-hearts-1.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Kingdom Hearts 2"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/kingdom-hearts-2.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "L.A. Noire"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/la-noire.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Left 4 Dead"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/left-4-dead.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Left 4 Dead 2"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/left-4-dead-2.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Legend of Grimrock"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/legend-of-grimrock.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Limbo"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/limbo.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Lone Survivor"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/lone-survivor.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Lost Odyssey"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/lost-odyssey.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Machinarium"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/machinarium.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Magicka"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/magicka.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Metal Gear Solid: The Twin Snakes"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/metal-gear-solid-the-twin-snakes.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Metal Gear Solid 2: Sons of Liberty"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/metal-gear-solid-2-sons-of-liberty.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Metal Gear Solid 3: Snake Eater"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/metal-gear-solid-3-snake-eater.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Metal Gear Solid 4: Guns of the Patriots"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/metal-gear-solid-4-guns-of-the-patriots.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Metal Gear Rising Revengeance"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/metal-gear-rising-revengeance.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Might and Magic: Clash of Heroes"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/might-and-magic-clash-of-heroes.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Minecraft"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/minecraft.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Mini Ninjas"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/mini-ninjas.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Mirrors Edge"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/mirrors-edge.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Mount and Blade"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/mount-and-blade.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Mount and Blade: Warband"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/mount-and-blade-warband.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Mount and Blade: With Fire and Sword"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/mount-and-blade-with-fire-and-sword.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Nier"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/nier.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Okami"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/okami.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Paper Mario"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/paper-mario.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Paper Mario: The Thousand Year Door"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/paper-mario-the-thousand-year-door.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Portal"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/portal.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Portal 2"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/portal-2.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Prince of Persia: The Forgotten Sands"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/prince-of-persia-the-forgotten-sands.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Prince of Persia: Warrior Within"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/prince-of-persia-warrior-within.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Prince of Persia: The Two Thrones"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/prince-of-persia-the-two-thrones.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Prince of Persia"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/prince-of-persia.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Psychonauts"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/psychonauts.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Shank"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/shank.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Sid Meier's Civilization V"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/sid-meiers-civilization-v.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Silent Hill HD Collection"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/silent-hill-hd-collection.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Skyrim"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/skyrim.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Sonic Generations"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/sonic-generations.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Spec Ops the Line"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/spec-ops-the-line.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Spiral Knights"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/spiral-knights.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Star Ocean: The Last Hope"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/star-ocean-the-last-hope.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Star Wars Jedi Knight II: Jedi Outcast"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/star-wars-jedi-knight-ii-jedi-outcast.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Star Wars: Knights of the Old Republic"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/star-wars-knights-of-the-old-republic.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Super Meat Boy"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/super-meat-boy.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Super Paper Mario"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/super-paper-mario.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Superbrothers: Sword and Sworcery"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/superbrothers-sword-and-sworcery-ep.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Abyss"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-abyss.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Destiny"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-destiny.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Destiny II"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-destiny-ii.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Eternia"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-eternia.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Graces"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-graces.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Hearts"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-hearts.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Innocence"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-innocence.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Legendia"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-legendia.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Phantasia"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-phantasia.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Rebirth"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-rebirth.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Symphonia"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-symphonia.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Symphonia: Dawn of the New World"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-symphonia-dawn-of-the-new-world.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Vesperia"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-vesperia.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tales of Xillia"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/tales-of-xillia.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Team Fortress 2"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/team-fortress-2.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Darkness"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/the-darkness.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Darkness II"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/the-darkness-ii.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Legend of Zelda: Ocarina of Time"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/the-legend-of-zelda-ocarina-of-time.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Legend of Zelda: Majora's Mask"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/the-legend-of-zelda-majoras-mask.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Legend of Zelda: The Wind Waker"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/the-legend-of-zelda-wind-waker.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Legend of Zelda: Twilight Princess"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/the-legend-of-zelda-twilight-princess.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Legend of Zelda: Skyward Sword"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/the-legend-of-zelda-skyward-sword.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Witcher"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/the-witcher-i.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "The Witcher II"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/the-witcher-ii.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Tomb Raider"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/tomb-raider.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Torchlight"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/torchlight.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Torchlight 2"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/torchlight-2.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Trine"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/trine.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Trine 2"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/trine-2.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Valkyria Chronicles"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/valkyria-chronicles.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "VVVVVV"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/vvvvvv.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Warhammer 40k: Space Marine"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/warhammer-40k-space-marine.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Wet"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/wet.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "White Knight Chronicles"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/white-knight-chronicles.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false
    Games.insert
      name: "Year Walk"
      genre: "Shooter"
      gameBy: "test"
      previewSrc: "/img/preview/year-walk.jpg"
      gameSrc: "/default/game.html"
      messages: []
      active: true
      version: ''
      featured: false###