Games.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true

if Games.find().count() == 0

  timeStamp = (new Date()).getTime()

  games = [
    submitted: timeStamp +=1
    owner: "Pieter Parker!!!"
    gameOwnerSlug: toSlug "Pieter Parker!!!"
    title: "BrowserQuest"
    gameTitleSlug: toSlug "BrowserQuest"
    description: "Take it to the next level with BrowserQuest! The online HTML5 based RPG!"
    backgroundUrl: ""
    gameSrc: ""
    threads: [
      _id: Meteor.uuid()
      submitted: timeStamp +=1
      owner: "Aang"
      title: "Original Content Post"
      threadTitleSlug: toSlug "Original Content Post"
      content: "THIS IS THE ORIGINAL POST!!!!"
      posts: [
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Aang"
        content: "SHIT YEAH"
      ,
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Pieter Parker!!!"
        content: "I'LL AGREE WITH ANYTHING"
      ]
    ]
  ,
    submitted: timeStamp +=1
    owner: "Aang"
    gameOwnerSlug: toSlug "Aang"
    title: "Mario Infinity"
    gameTitleSlug: toSlug "Mario Infinity"
    description: "Because I wanted to"
    backgroundUrl: ""
    gameSrc: ""
    threads: [
      _id: Meteor.uuid()
      submitted: timeStamp +=1
      owner: "Aang"
      title: "Original Content Post 2"
      threadTitleSlug: toSlug "Original Content Post 2"
      content: "THIS IS THE ORIGINAL POST!!!! 2"
      posts: [
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Aang"
        content: "SHIT YEAH 2"
      ,
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Pieter Parker!!!"
        content: "I'LL AGREE WITH ANYTHING 2"
      ]
    ]
  ,
    submitted: timeStamp +=1
    owner: "Kyle"
    gameOwnerSlug: toSlug "Kyle"
    title: "Sword and Sworcery"
    gameTitleSlug: toSlug "Sword and Sworcery"
    description: "This is a game"
    backgroundUrl: "/games/sword-and-sworcery/background/sword-and-sworcery-bg.png"
    gameSrc: ""
    threads: [
      _id: Meteor.uuid()
      submitted: timeStamp +=1
      owner: "Aang"
      title: "Original Content Post 2"
      threadTitleSlug: toSlug "Original Content Post 2"
      content: "THIS IS THE ORIGINAL POST!!!! 2"
      posts: [
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Aang"
        content: "SHIT YEAH 2"
      ,
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Pieter Parker!!!"
        content: "I'LL AGREE WITH ANYTHING 2"
      ]
    ]
  ,
    submitted: timeStamp +=1
    owner: "Kyle"
    gameOwnerSlug: toSlug "Kyle"
    title: "Sword and Sworcery 1"
    gameTitleSlug: toSlug "Sword and Sworcery 1"
    description: "This is a game"
    backgroundUrl: "/games/sword-and-sworcery/background/sword-and-sworcery-bg.png"
    gameSrc: ""
    threads: [
      _id: Meteor.uuid()
      submitted: timeStamp +=1
      owner: "Aang"
      title: "Original Content Post 2"
      threadTitleSlug: toSlug "Original Content Post 2"
      content: "THIS IS THE ORIGINAL POST!!!! 2"
      posts: [
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Aang"
        content: "SHIT YEAH 2"
      ,
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Pieter Parker!!!"
        content: "I'LL AGREE WITH ANYTHING 2"
      ]
    ]
  ,
    submitted: timeStamp +=1
    owner: "Kyle"
    gameOwnerSlug: toSlug "Kyle"
    title: "Sword and Sworcery 2"
    gameTitleSlug: toSlug "Sword and Sworcery 2"
    description: "This is a game"
    backgroundUrl: "/games/sword-and-sworcery/background/sword-and-sworcery-bg.png"
    gameSrc: ""
    threads: [
      _id: Meteor.uuid()
      submitted: timeStamp +=1
      owner: "Aang"
      title: "Original Content Post 2"
      threadTitleSlug: toSlug "Original Content Post 2"
      content: "THIS IS THE ORIGINAL POST!!!! 2"
      posts: [
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Aang"
        content: "SHIT YEAH 2"
      ,
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Pieter Parker!!!"
        content: "I'LL AGREE WITH ANYTHING 2"
      ]
    ]
  ,
    submitted: timeStamp +=1
    owner: "Kyle"
    gameOwnerSlug: toSlug "Kyle"
    title: "Sword and Sworcery 3"
    gameTitleSlug: toSlug "Sword and Sworcery 3"
    description: "This is a game"
    backgroundUrl: "/games/sword-and-sworcery/background/sword-and-sworcery-bg.png"
    gameSrc: ""
    threads: [
      _id: Meteor.uuid()
      submitted: timeStamp +=1
      owner: "Aang"
      title: "Original Content Post 2"
      threadTitleSlug: toSlug "Original Content Post 2"
      content: "THIS IS THE ORIGINAL POST!!!! 2"
      posts: [
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Aang"
        content: "SHIT YEAH 2"
      ,
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Pieter Parker!!!"
        content: "I'LL AGREE WITH ANYTHING 2"
      ]
    ]
  ,
    submitted: timeStamp +=1
    owner: "Kyle"
    gameOwnerSlug: toSlug "Kyle"
    title: "Sword and Sworcery 4"
    gameTitleSlug: toSlug "Sword and Sworcery 4"
    backgroundUrl: "/games/sword-and-sworcery/background/sword-and-sworcery-bg.png"
    previewSrc: ""
    gameSrc: ""
    pitches: [
      _id: Meteor.uuid()
      submitted: timeStamp +=1
      owner: "Aang"
      type: "text"
      content: "This is a game"
    ,
      _id: Meteor.uuid()
      submitted: timeStamp +=1
      owner: "Aang"
      type: "text"
      content: "Random Content goes in here"
    ,
      _id: Meteor.uuid()
      submitted: timeStamp +=1
      owner: "Kyle"
      type: "gallery"
      content: "Image url goes in here"
    ]
    threads: [
      _id: Meteor.uuid()
      submitted: timeStamp +=1
      owner: "Aang"
      title: "Original Content Post 2"
      threadTitleSlug: toSlug "Original Content Post 2"
      content: "THIS IS THE ORIGINAL POST!!!! 2"
      posts: [
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Aang"
        content: "SHIT YEAH 2"
      ,
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Pieter Parker!!!"
        content: "I'LL AGREE WITH ANYTHING 2"
      ]
    ]
  ,
    submitted: timeStamp +=1
    owner: "Kyle"
    gameOwnerSlug: toSlug "Kyle"
    title: "Sword and Sworcery 5"
    gameTitleSlug: toSlug "Sword and Sworcery 5"
    backgroundUrl: "/games/sword-and-sworcery/background/sword-and-sworcery-bg.png"
    gameSrc: ""
    pitches: [
      _id: Meteor.uuid()
      submitted: timeStamp +=1
      owner: "Aang"
      type: "text"
      content: "This is a game"
    ,
      _id: Meteor.uuid()
      submitted: timeStamp +=1
      owner: "Aang"
      type: "text"
      content: "Random Content goes in here"
    ,
      _id: Meteor.uuid()
      submitted: timeStamp +=1
      owner: "Kyle"
      type: "gallery"
      content: "Image url goes in here"
    ]
    threads: [
      _id: Meteor.uuid()
      submitted: timeStamp +=1
      owner: "Aang"
      title: "Original Content Post 2"
      threadTitleSlug: toSlug "Original Content Post 2"
      content: "THIS IS THE ORIGINAL POST!!!! 2"
      posts: [
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Aang"
        content: "SHIT YEAH 2"
      ,
        _id: Meteor.uuid()
        submitted: timeStamp +=1
        owner: "Pieter Parker!!!"
        content: "I'LL AGREE WITH ANYTHING 2"
      ]
    ]
  ]

  _.each games, (gameData)->
    log gameData
    game = Games.insert
      submitted: timeStamp
      owner: gameData.owner
      gameOwnerSlug: gameData.gameOwnerSlug
      title: gameData.title
      gameTitleSlug: gameData.gameTitleSlug
      backgroundUrl: gameData.backgroundUrl
      gameSrc: gameData.gameSrc
      pitches: gameData.pitches
      threads: gameData.threads


    timeStamp +=1

Meteor.publish "allGames", ->
  Games.find({},
    sort:
      submitted: -1
  )