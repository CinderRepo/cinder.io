Template.gameInfo.events
  'click .removeGameInfo':(e,t)->
    log '.removeGameInfo clicked'
    log this
    log this._id

    Games.update
      _id: Session.get 'currentGame'
    ,
      $pull:
        pitches:
          _id: this._id