Template.rightSidebar.events
  "click .publishContentInfo":(e,t)->
    log ".publishContentInfo clicked"

    #Update all the relevant contentInfo panels
    contentInfos = t.findAll(".contentInfoEditor")
    _.each contentInfos, (contentInfo,index) ->
      log "contentInfo!"
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
        _id: Session.get "currentContent"
      ,
        modifier

      ###Games.update
        _id: Session.get 'currentGame'
      ,
        $set:
          pitches[index].content:'SMARTMOVE'###
  "click .addContentInfo":(e,t)->
    log ".addContentInfo clicked"
    log this
    log this._id
    log e.currentTarget
    log t

    Content.update
      _id: Session.get "currentContent"
    ,
      $push:
        pitches:
          _id: Meteor.uuid()
          type: "text"
          content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."