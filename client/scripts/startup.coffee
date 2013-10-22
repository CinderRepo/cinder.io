###Meteor.startup(()->
  Session.setDefault("signupFormActive",false)
  Session.setDefault("loginFormActive",true)

  #Search in Contents and create users based on owners of
  #content, with some stub data in place for their accounts.
  if Meteor.users.find().count() == 0
    owners = Content.find().fetch()
    ownerNames = _.pluck(owners,'owner')

    uniqueOwnerNames = _.uniq ownerNames
    #log "uniqueOwnerNames:",uniqueOwnerNames

    _.each uniqueOwnerNames, (owner) ->
      #Create a stub user based on what content we currently have available

      #Query for owned content by the user
      ownedContent = Content.find(owner:owner).fetch()
      ownedContentArray = _.pluck(ownedContent,'_id')
      #log "ownedContentArray:",ownedContentArray

      #Create a user object that includes that owned content
      user =
        username: owner
        email: owner.replace(/\s+/g, '').toLowerCase() + "@email.com"
        password: "password"
        profile:
          content: ownedContentArray
          following: []
      #log "user:",user

      #Create the user with the appropriate stub data
      Accounts.createUser(user,(err)->
        #Find for content the user owns in the contents collection once
        #the account has been successfully created on the server
        if err
          log err
        else
          log "Running?"
          _.each ownedContentArray, (contentId) ->
            content = Content.findOne(_id:contentId)
            #log "contentId:",contentId
            user =
              Meteor.users.findOne("profile.content":contentId)
            #log "content:",content
            #log "user._id:",user._id
            #Add the userId to the Content's collaborators array
            #log "Adding user to content collaborators array"
            Content.update
              _id:contentId
            ,
              $push:
                collaborators: user._id
            ,
              (err,result)->
                #log "Updating pitches callback fired"
                #log "err: ",err
                #log "result: ",result
                #log "Content.namedContext('default').invalidKeys()",Content.namedContext("default").invalidKeys()
            #content.collaborators.push user._id
      )

      #Add the users to the content as stub collaborators

)
#Deps.autorun(->
  #Make sure there is always an automatic user logged in.
  #if !Meteor.user()
  #  Meteor.loginAnonymously()
#)###