Content.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true

if Content.find().count() == 0

  content = [
    owner: "Stephen Baden"
    ownerSlug: _.slugify "Stephen Baden"
    title: "The Social Network"
    titleSlug: _.slugify "The Social Network"
    type: "movie"
    description: "You can't make 500 million friends without making a few enemies."
    contentBg: "/games/sword-and-sworcery/background/sword-and-sworcery-bg.png"
    contentSrc: ""
    featured: true
    pitches: []
    threads: [
      submitted: timeStamp +=1
      _id: Meteor.uuid()
      owner: "Aang"
      title: "Original Movie Post"
      titleSlug: _.slugify "Original Movie Post"
      content: "THIS IS THE ORIGINAL MOVIE POST!!!!"
      posts: [
        submitted: timeStamp +=1
        _id: Meteor.uuid()
        owner: "Aang"
        content: "SHIT YEAH TALKING ABOUT A MOVIE"
      ,
        submitted: timeStamp +=1
        _id: Meteor.uuid()
        owner: "Pieter Parker!!!"
        content: "I'LL AGREE WITH ANYTHING MOVIE RELATED"
      ]
    ]
  ,
    owner: "Wild Kyle"
    ownerSlug: _.slugify "Wild Kyle"
    title: "Limitless"
    titleSlug: _.slugify "Limitless"
    type: "movie"
    description: "Picture a life without limits. Then go beyond it."
    contentBg: "/games/sword-and-sworcery/background/sword-and-sworcery-bg.png"
    contentSrc: ""
    featured: false
    pitches: []
    threads: [
      submitted: timeStamp +=1
      _id: Meteor.uuid()
      owner: "Aang"
      title: "Original Movie Post 2"
      titleSlug: _.slugify "Original Movie Post 2"
      content: "THIS IS THE ORIGINAL MOVIE POST!!!! 2"
      posts: [
        submitted: timeStamp +=1
        _id: Meteor.uuid()
        owner: "Aang"
        content: "SHIT YEAH TALKING ABOUT A MOVIE 2"
      ,
        submitted: timeStamp +=1
        _id: Meteor.uuid()
        owner: "Pieter Parker!!!"
        content: "I'LL AGREE WITH ANYTHING MOVIE RELATED 2"
      ]
    ]
  ,
    owner: "Wild Kyle"
    ownerSlug: _.slugify "Wild Kyle"
    title: "Super Soap Dropper"
    titleSlug: _.slugify "Super Soap Dropper"
    type: "game"
    description: "Don't drop the soap. Seriously."
    contentBg: "/games/sword-and-sworcery/background/sword-and-sworcery-bg.png"
    contentSrc: ""
    pitches: []
    threads: [
      submitted: timeStamp +=1
      _id: Meteor.uuid()
      owner: "Aang"
      title: "Original Game Post"
      titleSlug: _.slugify "Original Game Post"
      content: "THIS IS THE ORIGINAL GAME POST!!!!"
      posts: [
        submitted: timeStamp +=1
        _id: Meteor.uuid()
        owner: "Aang"
        content: "SHIT YEAH TALKING ABOUT A GAME"
      ,
        submitted: timeStamp +=1
        _id: Meteor.uuid()
        owner: "Pieter Parker!!!"
        content: "I'LL AGREE WITH ANYTHING GAME RELATED 2"
      ]
    ]
  ,
    owner: "Pawka"
    ownerSlug: _.slugify "Pawka"
    title: "Super Punch"
    titleSlug: _.slugify "Super Punch"
    type: "game"
    description: "Punch that shit."
    contentBg: "/games/sword-and-sworcery/background/sword-and-sworcery-bg.png"
    contentSrc: ""
    featured: true
    pitches: []
    threads: [
      submitted: timeStamp +=1
      _id: Meteor.uuid()
      owner: "Aang"
      title: "Original Game Post"
      titleSlug: _.slugify "Original Game Post"
      content: "THIS IS THE ORIGINAL GAME POST!!!!"
      posts: [
        submitted: timeStamp +=1
        _id: Meteor.uuid()
        owner: "Aang"
        content: "SHIT YEAH TALKING ABOUT A GAME"
      ,
        submitted: timeStamp +=1
        _id: Meteor.uuid()
        owner: "Pieter Parker!!!"
        content: "I'LL AGREE WITH ANYTHING GAME RELATED 2"
      ]
    ]
  ,
    owner: "Andrew Guardamano"
    ownerSlug: _.slugify "Andrew Guardamano"
    title: "Puffed"
    titleSlug: _.slugify "Puffed"
    type: "show"
    description: "Never eat marshmallows."
    contentBg: "/games/sword-and-sworcery/background/sword-and-sworcery-bg.png"
    contentSrc: ""
    featured: true
    pitches: []
    threads: [
      submitted: timeStamp +=1
      _id: Meteor.uuid()
      owner: "Aang"
      title: "Original Show Post"
      titleSlug: _.slugify "Original Show Post"
      content: "THIS IS THE ORIGINAL SHOW POST!!!!"
      posts: [
        submitted: timeStamp +=1
        _id: Meteor.uuid()
        owner: "Aang"
        content: "SHIT YEAH TALKING ABOUT A SHOW"
      ,
        submitted: timeStamp +=1
        _id: Meteor.uuid()
        owner: "Pieter Parker!!!"
        content: "I'LL AGREE WITH ANYTHING SHOW RELATED 2"
      ]
    ]
  ,
    owner: "Andrew Guardamano"
    ownerSlug: _.slugify "Andrew Guardamano"
    title: "Stuffed"
    titleSlug: _.slugify "Stuffed"
    type: "show"
    description: "Never eat pumpkin pie."
    contentBg: "/games/sword-and-sworcery/background/sword-and-sworcery-bg.png"
    contentSrc: ""
    featured: false
    pitches: []
    threads: [
      submitted: timeStamp +=1
      _id: Meteor.uuid()
      owner: "Aang"
      title: "Original Show Post"
      titleSlug: _.slugify "Original Show Post"
      content: "THIS IS THE ORIGINAL SHOW POST!!!!"
      posts: [
        submitted: timeStamp +=1
        _id: Meteor.uuid()
        owner: "Aang"
        content: "SHIT YEAH TALKING ABOUT A SHOW"
      ,
        submitted: timeStamp +=1
        _id: Meteor.uuid()
        owner: "Pieter Parker!!!"
        content: "I'LL AGREE WITH ANYTHING SHOW RELATED 2"
      ]
    ]
  ]

  timeStamp = (new Date()).getTime()

  _.each content, (contentData)->
    content = Content.insert
      submitted: timeStamp
      owner: contentData.owner
      ownerSlug: contentData.ownerSlug
      title: contentData.title
      titleSlug: contentData.titleSlug
      type: contentData.type
      description: contentData.description
      contentBg: contentData.contentBg
      contentSrc: contentData.contentSrc
      featured: contentData.featured
      pitches: contentData.pitches
      threads: contentData.threads

    timeStamp +=1

Meteor.publish "allContent", ->
  Content.find({},
    sort:
      submitted: -1
  )