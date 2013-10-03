Template.contentInfo.events
  'click .removeContentInfo':(e,t)->
    log '.removeContentInfo clicked'
    log this
    log this._id

    Content.update
      _id: Session.get 'currentContent'
    ,
      $pull:
        pitches:
          _id: this._id