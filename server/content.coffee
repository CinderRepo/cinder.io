Content.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true

#This is a default pitch that appears for everyone who creates an account
#defaultPitchText = "Type whatever your heart desires in this box!"

###if Content.find().count() == 0
  content = []

  timeStamp = (new Date()).getTime()

  _.each content, (contentData)->
    content =
    Content.insert
      #submitted: timeStamp
      owner: contentData.owner
      ownerSlug: contentData.ownerSlug
      title: contentData.title
      titleSlug: contentData.titleSlug
      type: contentData.type
      contentBg: contentData.contentBg
      contentPreview: contentData.contentPreview
      contentSrc: contentData.contentSrc
      featured: contentData.featured
      collaborators: contentData.collaborators
      about: contentData.about
      community: contentData.community
      rewards: contentData.rewards
      commissions: contentData.commissions
      updates: contentData.updates
    ,(err,result)->
      log "err:",err
      log "result:",result
      log "Content.namedContext('default').invalidKeys()",Content.namedContext("default").invalidKeys()

    timeStamp +=1###

Meteor.publish "allContent", ->
  Content.find({}#,
    #sort:
      #submitted: -1
  )