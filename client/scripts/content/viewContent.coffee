Template.viewContent.events
  'click .publishContentInfo':(e,t)->
    log '.publishContentInfo clicked'

    #XXX: Clean this up to make it actually dry, perhaps
    #make it so that it just goes through and grabs and document
    #that has a certain idea/has a text area of contentInfoEditor?
    contentMasthead = t.find('.contentMasthead')

    Content.update
      _id: Session.get 'currentContent'
    ,
      $set:
        title: contentMasthead.value

    #Update all the relevant contentInfo panels
    contentInfos = t.findAll('.contentInfoEditor')
    _.each contentInfos, (contentInfo,index) ->
      log 'contentInfo!'
      log this
      log contentInfo
      log index
      log contentInfo.value

      #XXX: This is a workaround as minimongo doesn't
      #currently support positional selectors on
      #the client, when they do we'll want to update
      #this to be something like 'pitches.$.content'
      #instead.

      modifier = $set: {}
      #Create the modifer based on the index of the contentInfo
      #and update the meteor collection based on the text values
      #currently stored in the inferno collaborative text editor.
      modifier.$set["pitches." + index + ".content"] = contentInfo.value
      Content.update
        _id: Session.get 'currentContent'
      ,
        modifier

      ###Games.update
        _id: Session.get 'currentGame'
      ,
        $set:
          pitches[index].content:'SMARTMOVE'###
  'click .addContentInfo':(e,t)->
    log '.addContentInfo clicked'
    log this
    log this._id
    log e.currentTarget
    log t

    Content.update
      _id: Session.get 'currentContent'
    ,
      $push:
        pitches:
          _id: Meteor.uuid()
          type: 'text'
          content: 'Type here to start adding your own text'