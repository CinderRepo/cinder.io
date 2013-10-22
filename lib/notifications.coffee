###if Meteor.isClient
  @Time = new Meteor.Collection("time")
  Meteor.subscribe "time"
  #Clear all notifications on page refresh
  Template.home.helpers
    time: ->
      Time.find(userId:Meteor.userId())

if Meteor.isServer
  @Time = new Meteor.Collection("time",connection:null)
  Meteor.publish "time", ->
    Time.find(userId:this.userId)
  Time.allow
    insert: (userId,doc) ->
      log "Insert called"
      log "userId: ",userId
      log "doc: ",doc
      true
    update: (userId,doc) ->
      log "Update called"
      log "userId: ",userId
      log "doc: ",doc
      true
    remove: (userId,doc) ->
      log "Remove called"
      log "userId: ",userId
      log "doc: ",doc
      true

@sendNotification = (message) ->
  if Meteor.isClient
    log "sendNotification called on the client!"
    log "message: ",message
    if Meteor.userId()
      Time.insert
        userId:Meteor.userId()
        context:message.context
        field:message.field
        message:message.message
    #log "Client Time:",Time.findOne()
    #log "Clientside Meteor.userId()",Meteor.userId()

  if Meteor.isServer
    log "============================================================================================================================================================="
    log "sendNotification called on the server!"
    log "server message: ",message
    #Only publish to users that are logged in, be it anonymous or registered
    if Meteor.userId()
      userId = Meteor.userId()
      if Time.findOne(userId:userId,message:message.message)
        log "This type of message already exists! We should probably..do something about it.."
      else
        log "I'm gonna insert the message even if it already exists, but I also need to do something to check and delete messages that are no longer valid to the user"
        Time.insert
          userId:userId
          context:message.context
          field:message.field
          message:message.message
      #log Time.find().fetch()

@clearNotification = (message)->
  if Meteor.isClient
    log "clearNotification called on the client!"
    log "message: ",message

  if Meteor.isServer
    log "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    log "clearNotification called on the server!"
    log "server message: ",message

    if Meteor.userId()
      userId = Meteor.userId()
      if Time.findOne(userId:userId)
        log "Clearing the following messages!"
        log Time.find(userId:userId).fetch()
        Time.remove(field:message.field)###