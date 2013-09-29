Template.viewGame.events
  'click .publishGameInfo':(e,t)->
    log '.publishGameInfo clicked'

    #XXX: Clean this up to make it actually dry, perhaps
    #make it so that it just goes through and grabs and document
    #that has a certain idea/has a text area of gameInfoEditor?
    gameMasthead = t.find('.gameMasthead')

    Games.update
      _id: Session.get 'currentGame'
    ,
      $set:
        title: gameMasthead.value

    #Update all the relevant gameInfo panels
    gameInfos = t.findAll('.gameInfoEditor')
    _.each gameInfos, (gameInfo,index) ->
      log 'gameInfo!'
      log this
      log gameInfo
      log index
      log gameInfo.value

      #XXX: This is a workaround as minimongo doesn't
      #currently support positional selectors on
      #the client, when they do we'll want to update
      #this to be something like 'pitches.$.content'
      #instead.

      modifier = $set: {}
      #Create the modifer based on the index of the gameInfo
      #and update the meteor collection based on the text values
      #currently stored in the inferno collaborative text editor.
      modifier.$set["pitches." + index + ".content"] = gameInfo.value
      Games.update
        _id: Session.get 'currentGame'
      ,
        modifier

      ###Games.update
        _id: Session.get 'currentGame'
      ,
        $set:
          pitches[index].content:'SMARTMOVE'###
  'click .addGameInfo':(e,t)->
    log '.addGameInfo clicked'
    log this
    log this._id
    log e.currentTarget
    log t

    Games.update
      _id: Session.get 'currentGame'
    ,
      $push:
        pitches:
          _id: Meteor.uuid()
          type: 'text'
          content: 'Type here to start adding your own text'