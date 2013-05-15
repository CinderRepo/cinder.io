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

  if Games.find().count() == 0
    Games.insert
      name: "Alan Wake's American Nightmare"
      genre: "RPG"
      gameBy: "test"
      src: "/img/thumbs/alan-wakes-american-nightmare.jpg"
      comments: []
      active: true
    Games.insert
      name: "Alice Madness Returns"
      genre: "Sim"
      gameBy: "test"
      src: "/img/thumbs/alice-madness-returns.jpg"
      comments: []
      active: true
    Games.insert
      name: "Alone in the Dark"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/alone-in-the-dark.jpg"
      comments: []
      active: true
    Games.insert
      name: "Amnesia the Dark Descent"
      genre: "RPG"
      gameBy: "test"
      src: "/img/thumbs/amnesia-the-dark-descent.jpg"
      comments: []
      active: true
    Games.insert
      name: "And Yet it Moves"
      genre: "RPG"
      gameBy: "test"
      src: "/img/thumbs/and-yet-it-moves.jpg"
      comments: []
      active: true
    Games.insert
      name: "Bastion"
      genre: "Sim"
      gameBy: "test"
      src: "/img/thumbs/bastion.jpg"
      comments: []
      active: true
    Games.insert
      name: "Batman Arkham Asylum"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/batman-arkham-asylum.jpg"
      comments: []
      active: true
    Games.insert
      name: "Batman Arkham City"
      genre: "RPG"
      gameBy: "test"
      src: "/img/thumbs/batman-arkham-city.jpg"
      comments: []
      active: true
    Games.insert
      name: "Bioshock"
      genre: "Sim"
      gameBy: "test"
      src: "/img/thumbs/bioshock.jpg"
      comments: []
      active: true
    Games.insert
      name: "Bioshock 2"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/bioshock-2.jpg"
      comments: []
      active: true
    Games.insert
      name: "Bioshock Infinite"
      genre: "RPG"
      gameBy: "test"
      src: "/img/thumbs/bioshock-infinite.jpg"
      comments: []
      active: true
    Games.insert
      name: "Bit Trip Runner"
      genre: "Sim"
      gameBy: "test"
      src: "/img/thumbs/bit-trip-runner.jpg"
      comments: []
      active: true
    Games.insert
      name: "Borderlands 2"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/borderlands-2.jpg"
      comments: []
      active: true
    Games.insert
      name: "Braid"
      genre: "RPG"
      gameBy: "test"
      src: "/img/thumbs/braid.jpg"
      comments: []
      active: true
    Games.insert
      name: "Brutal Legend"
      genre: "Sim"
      gameBy: "test"
      src: "/img/thumbs/brutal-legend.jpg"
      comments: []
      active: true
    Games.insert
      name: "Catherine"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/catherine.jpg"
      comments: []
      active: true
    Games.insert
      name: "Cave Story Plus"
      genre: "RPG"
      gameBy: "test"
      src: "/img/thumbs/cave-story-plus.jpg"
      comments: []
      active: true
    Games.insert
      name: "Cogs"
      genre: "Sim"
      gameBy: "test"
      src: "/img/thumbs/cogs.jpg"
      comments: []
      active: true
    Games.insert
      name: "Counter Strike Source"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/counter-strike-source.jpg"
      comments: []
      active: true
    Games.insert
      name: "Crayon Physics Deluxe"
      genre: "RPG"
      gameBy: "test"
      src: "/img/thumbs/crayon-physics-deluxe.jpg"
      comments: []
      active: true
    Games.insert
      name: "Dark Souls"
      genre: "Sim"
      gameBy: "test"
      src: "/img/thumbs/dark-souls.jpg"
      comments: []
      active: true
    Games.insert
      name: "Dark Void"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/dark-void.jpg"
      comments: []
      active: true
    Games.insert
      name: "Darksiders I"
      genre: "RPG"
      gameBy: "test"
      src: "/img/thumbs/darksiders-i.jpg"
      comments: []
      active: true
    Games.insert
      name: "Darksiders II"
      genre: "Sim"
      gameBy: "test"
      src: "/img/thumbs/darksiders-ii.jpg"
      comments: []
      active: true
    Games.insert
      name: "Day of Defeat Source"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/day-of-defeat-source.jpg"
      comments: []
      active: true
    Games.insert
      name: "Dead Island"
      genre: "RPG"
      gameBy: "test"
      src: "/img/thumbs/dead-island.jpg"
      comments: []
      active: true
    Games.insert
      name: "Deadly Premonition"
      genre: "Sim"
      gameBy: "test"
      src: "/img/thumbs/deadly-premonition.jpg"
      comments: []
      active: true
    Games.insert
      name: "Demon's Souls"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/demons-souls.jpg"
      comments: []
      active: true
    ###Games.insert
      name: "Devil May Cry One"
      genre: "RPG"
      gameBy: "test"
      src: "/img/thumbs/devil-may-cry-1.jpg"
      comments: []
      active: true
    Games.insert
      name: "Devil May Cry Two"
      genre: "Sim"
      gameBy: "test"
      src: "/img/thumbs/devil-may-cry-2.jpg"
      comments: []
      active: true
    Games.insert
      name: "Devil May Cry Three"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/devil-may-cry-3.jpg"
      comments: []
      active: true
    Games.insert
      name: "Devil May Cry Four"
      genre: "RPG"
      gameBy: "test"
      src: "/img/thumbs/devil-may-cry-4.jpg"
      comments: []
      active: true
    Games.insert
      name: "Devil may Cry Five"
      genre: "Sim"
      gameBy: "test"
      src: "/img/thumbs/devil-may-cry-5.jpg"
      comments: []
      active: true
    Games.insert
      name: "Digital Devil Saga"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/digital-devil-saga.jpg"
      comments: []
      active: true
    Games.insert
      name: "Disgaea"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/disgaea.jpg"
      comments: []
      active: true
    Games.insert
      name: "Dungeon Defenders"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/dungeon-defenders.jpg"
      comments: []
      active: true
    Games.insert
      name: "Eternal Sonata"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/eternal-sonata.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy Crystal Chronicles"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-crystal-chronicles.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy I"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-i.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy II"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-ii.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy III"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-iii.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy IV"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-iv.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy V"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-v.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy VI"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-vi.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy VII"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-vii.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy VIII"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-viii.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy IX"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-ix.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy X"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-x.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy X-2"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-x-2.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy XI"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-xi.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy XII"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-xii.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy XIII"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-xiii.jpg"
      comments: []
      active: true
    Games.insert
      name: "Final Fantasy XIV"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/final-fantasy-xiv.jpg"
      comments: []
      active: true
    Games.insert
      name: "Folklore"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/folklore.jpg"
      comments: []
      active: true
    Games.insert
      name: "Garry's Mod"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/garrys-mod.jpg"
      comments: []
      active: true
    Games.insert
      name: "Gotham City Imposters"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/gotham-city-imposters.jpg"
      comments: []
      active: true
    Games.insert
      name: "Gratuitious Space Battles"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/gratuitous-space-battles.jpg"
      comments: []
      active: true
    Games.insert
      name: "Half Life 2"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/half-life-2.jpg"
      comments: []
      active: true
    Games.insert
      name: "Half Life 2 Episode One"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/half-life-2-episode-one.jpg"
      comments: []
      active: true
    Games.insert
      name: "Half Life 2 Episode Two"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/half-life-2-episode-two.jpg"
      comments: []
      active: true
    Games.insert
      name: "Harvest Moon Magical Melody"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/harvest-moon-magical-melody.jpg"
      comments: []
      active: true
    Games.insert
      name: "Hitman Blood Money"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/hitman-blood-money.jpg"
      comments: []
      active: true
    Games.insert
      name: "Hitman Contracts"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/hitman-contracts.jpg"
      comments: []
      active: true
    Games.insert
      name: "Hitman Codename 47"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/hitman-codename-47.jpg"
      comments: []
      active: true
    Games.insert
      name: "Hitman 2 Silent Assassin"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/hitman-2-silent-assassin.jpg"
      comments: []
      active: true
    Games.insert
      name: "Hitman Absolution"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/hitman-absolution.jpg"
      comments: []
      active: true
    Games.insert
      name: "Just Cause 2"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/just-cause-2.jpg"
      comments: []
      active: true
    Games.insert
      name: "Killing Floor"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/killing-floor.jpg"
      comments: []
      active: true
    Games.insert
      name: "Kingdom Hearts"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/kingdom-hearts-1.jpg"
      comments: []
      active: true
    Games.insert
      name: "Kingdom Hearts 2"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/kingdom-hearts-2.jpg"
      comments: []
      active: true
    Games.insert
      name: "L.A. Noire"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/la-noire.jpg"
      comments: []
      active: true
    Games.insert
      name: "Left 4 Dead"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/left-4-dead.jpg"
      comments: []
      active: true
    Games.insert
      name: "Left 4 Dead 2"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/left-4-dead-2.jpg"
      comments: []
      active: true
    Games.insert
      name: "Legend of Grimrock"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/legend-of-grimrock.jpg"
      comments: []
      active: true
    Games.insert
      name: "Limbo"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/limbo.jpg"
      comments: []
      active: true
    Games.insert
      name: "Lone Survivor"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/lone-survivor.jpg"
      comments: []
      active: true
    Games.insert
      name: "Lost Odyssey"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/lost-odyssey.jpg"
      comments: []
      active: true
    Games.insert
      name: "Machinarium"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/machinarium.jpg"
      comments: []
      active: true
    Games.insert
      name: "Magicka"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/magicka.jpg"
      comments: []
      active: true
    Games.insert
      name: "Metal Gear Solid: The Twin Snakes"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/metal-gear-solid-the-twin-snakes.jpg"
      comments: []
      active: true
    Games.insert
      name: "Metal Gear Solid 2: Sons of Liberty"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/metal-gear-solid-2-sons-of-liberty.jpg"
      comments: []
      active: true
    Games.insert
      name: "Metal Gear Solid 3: Snake Eater"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/metal-gear-solid-3-snake-eater.jpg"
      comments: []
      active: true
    Games.insert
      name: "Metal Gear Solid 4: Guns of the Patriots"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/metal-gear-solid-4-guns-of-the-patriots.jpg"
      comments: []
      active: true
    Games.insert
      name: "Metal Gear Rising Revengeance"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/metal-gear-rising-revengeance.jpg"
      comments: []
      active: true
    Games.insert
      name: "Might and Magic: Clash of Heroes"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/might-and-magic-clash-of-heroes.jpg"
      comments: []
      active: true
    Games.insert
      name: "Minecraft"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/minecraft.jpg"
      comments: []
      active: true
    Games.insert
      name: "Mini Ninjas"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/mini-ninjas.jpg"
      comments: []
      active: true
    Games.insert
      name: "Mirrors Edge"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/mirrors-edge.jpg"
      comments: []
      active: true
    Games.insert
      name: "Mount and Blade"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/mount-and-blade.jpg"
      comments: []
      active: true
    Games.insert
      name: "Mount and Blade: Warband"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/mount-and-blade-warband.jpg"
      comments: []
      active: true
    Games.insert
      name: "Mount and Blade: With Fire and Sword"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/mount-and-blade-with-fire-and-sword.jpg"
      comments: []
      active: true
    Games.insert
      name: "Nier"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/nier.jpg"
      comments: []
      active: true
    Games.insert
      name: "Okami"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/okami.jpg"
      comments: []
      active: true
    Games.insert
      name: "Paper Mario"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/paper-mario.jpg"
      comments: []
      active: true
    Games.insert
      name: "Paper Mario: The Thousand Year Door"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/paper-mario-the-thousand-year-door.jpg"
      comments: []
      active: true
    Games.insert
      name: "Portal"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/portal.jpg"
      comments: []
      active: true
    Games.insert
      name: "Portal 2"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/portal-2.jpg"
      comments: []
      active: true
    Games.insert
      name: "Prince of Persia: The Forgotten Sands"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/prince-of-persia-the-forgotten-sands.jpg"
      comments: []
      active: true
    Games.insert
      name: "Prince of Persia: Warrior Within"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/prince-of-persia-warrior-within.jpg"
      comments: []
      active: true
    Games.insert
      name: "Prince of Persia: The Two Thrones"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/prince-of-persia-the-two-thrones.jpg"
      comments: []
      active: true
    Games.insert
      name: "Prince of Persia"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/prince-of-persia.jpg"
      comments: []
      active: true
    Games.insert
      name: "Psychonauts"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/psychonauts.jpg"
      comments: []
      active: true
    Games.insert
      name: "Shank"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/shank.jpg"
      comments: []
      active: true
    Games.insert
      name: "Sid Meier's Civilization V"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/sid-meiers-civilization-v.jpg"
      comments: []
      active: true
    Games.insert
      name: "Silent Hill HD Collection"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/silent-hill-hd-collection.jpg"
      comments: []
      active: true
    Games.insert
      name: "Skyrim"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/skyrim.jpg"
      comments: []
      active: true
    Games.insert
      name: "Sonic Generations"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/sonic-generations.jpg"
      comments: []
      active: true
    Games.insert
      name: "Spec Ops the Line"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/spec-ops-the-line.jpg"
      comments: []
      active: true
    Games.insert
      name: "Spiral Knights"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/spiral-knights.jpg"
      comments: []
      active: true
    Games.insert
      name: "Star Ocean: The Last Hope"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/star-ocean-the-last-hope.jpg"
      comments: []
      active: true
    Games.insert
      name: "Star Wars Jedi Knight II: Jedi Outcast"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/star-wars-jedi-knight-ii-jedi-outcast.jpg"
      comments: []
      active: true
    Games.insert
      name: "Star Wars: Knights of the Old Republic"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/star-wars-knights-of-the-old-republic.jpg"
      comments: []
      active: true
    Games.insert
      name: "Super Meat Boy"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/super-meat-boy.jpg"
      comments: []
      active: true
    Games.insert
      name: "Super Paper Mario"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/super-paper-mario.jpg"
      comments: []
      active: true
    Games.insert
      name: "Superbrothers: Sword and Sworcery"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/superbrothers-sword-and-sworcery-ep.jpg"
      comments: []
      active: true
    Games.insert
      name: "Tales of Abyss"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/tales-of-abyss.jpg"
      comments: []
      active: true
    Games.insert
      name: "Tales of Destiny"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/tales-of-destiny.jpg"
      comments: []
      active: true
    Games.insert
      name: "Tales of Destiny II"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/tales-of-destiny-ii.jpg"
      comments: []
      active: true
    Games.insert
      name: "Tales of Eternia"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/tales-of-eternia.jpg"
      comments: []
      active: true
    Games.insert
      name: "Tales of Graces"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/tales-of-graces.jpg"
      comments: []
      active: true
    Games.insert
      name: "Tales of Hearts"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/tales-of-hearts.jpg"
      comments: []
      active: true
    Games.insert
      name: "Tales of Innocence"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/tales-of-innocence.jpg"
      comments: []
      active: true
    Games.insert
      name: "Tales of Legendia"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/tales-of-legendia.jpg"
      comments: []
      active: true
    Games.insert
      name: "Tales of Phantasia"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/tales-of-phantasia.jpg"
      comments: []
      active: true
    Games.insert
      name: "Tales of Rebirth"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/tales-of-rebirth.jpg"
      comments: []
      active: true
    Games.insert
      name: "Tales of Symphonia"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/tales-of-symphonia.jpg"
      comments: []
      active: true
    Games.insert
      name: "Tales of Symphonia: Dawn of the New World"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/tales-of-symphonia-dawn-of-the-new-world.jpg"
      comments: []
      active: true
    Games.insert
      name: "Tales of Vesperia"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/tales-of-vesperia.jpg"
      comments: []
      active: true
    Games.insert
      name: "Tales of Xillia"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/tales-of-xillia.jpg"
      comments: []
      active: true
    Games.insert
      name: "Team Fortress 2"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/team-fortress-2.jpg"
      comments: []
      active: true
    Games.insert
      name: "The Darkness"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/the-darkness.jpg"
      comments: []
      active: true
    Games.insert
      name: "The Darkness II"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/the-darkness-ii.jpg"
      comments: []
      active: true
    Games.insert
      name: "The Legend of Zelda: Ocarina of Time"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/the-legend-of-zelda-ocarina-of-time.jpg"
      comments: []
      active: true
    Games.insert
      name: "The Legend of Zelda: Majora's Mask"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/the-legend-of-zelda-majoras-mask.jpg"
      comments: []
      active: true
    Games.insert
      name: "The Legend of Zelda: The Wind Waker"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/the-legend-of-zelda-wind-waker.jpg"
      comments: []
      active: true
    Games.insert
      name: "The Legend of Zelda: Twilight Princess"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/the-legend-of-zelda-twilight-princess.jpg"
      comments: []
      active: true
    Games.insert
      name: "The Legend of Zelda: Skyward Sword"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/the-legend-of-zelda-skyward-sword.jpg"
      comments: []
      active: true
    Games.insert
      name: "The Witcher"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/the-witcher-i.jpg"
      comments: []
      active: true
    Games.insert
      name: "The Witcher II"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/the-witcher-ii.jpg"
      comments: []
      active: true
    Games.insert
      name: "Tomb Raider"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/tomb-raider.jpg"
      comments: []
      active: true
    Games.insert
      name: "Torchlight"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/torchlight.jpg"
      comments: []
      active: true
    Games.insert
      name: "Torchlight 2"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/torchlight-2.jpg"
      comments: []
      active: true
    Games.insert
      name: "Trine"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/trine.jpg"
      comments: []
      active: true
    Games.insert
      name: "Trine 2"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/trine-2.jpg"
      comments: []
      active: true
    Games.insert
      name: "Valkyria Chronicles"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/valkyria-chronicles.jpg"
      comments: []
      active: true
    Games.insert
      name: "VVVVVV"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/vvvvvv.jpg"
      comments: []
      active: true
    Games.insert
      name: "Warhammer 40k: Space Marine"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/warhammer-40k-space-marine.jpg"
      comments: []
      active: true
    Games.insert
      name: "Wet"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/wet.jpg"
      comments: []
      active: true
    Games.insert
      name: "White Knight Chronicles"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/white-knight-chronicles.jpg"
      comments: []
      active: true
    Games.insert
      name: "Year Walk"
      genre: "Shooter"
      gameBy: "test"
      src: "/img/thumbs/year-walk.jpg"
      comments: []
      active: true###