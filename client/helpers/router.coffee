#Track any changes to the application's state and rerun the function when the state changes
Meteor.startup(()->
  Deps.autorun((c)->
    state = Session.get('appState')
    #This is used to append the modalState hashtags to the end of the url
    #modalState = if Session.get('modalState') then '#' + Session.get('modalState') else false
    #Session.get('activeTile')
    #Meteor.startup(()->
      #state = Session.get('appState')
    console.log 'appState updated!'
    switch state
      when 'browse'
            console.log 'State has switched to browse!'
            Meteor.Router.to '/'
      when 'preview'
            console.log 'State has switched to preview!'
            Meteor.Router.to '/' + Session.get('activeTile')
      when 'view'
            console.log 'State has switched to view!'
            Meteor.Router.to '/' + Session.get('activeTile') + '/' + state
      when 'play'
            console.log 'State has switched to play!'
            Meteor.Router.to '/' + Session.get('activeTile') + '/view/' + state
      else console.log 'Invalid state!'
    #log 'TRIGGERED'
    #if Session.equals('activeTile',null) and Session.equals('appState',null)
      #Meteor.Router.to('/')
      #toggleTile($('.tileWrapper.expanded .tile')[0],null)
      #$('.paneWrapper').attr('data-state','')
    #else
      #log 'Hurp'
    #  if Session.get('activeTile') and Session.equals('appState',null)
    #    log 'Hmmm'
        #Meteor.Router.to('/' + Session.get('activeTile'))
        #toggleTile($('#' + Session.get('activeTile'))[0],Session.get('activeTile'))
        #$('.paneWrapper').attr('data-state','')
    #  else if Session.get('activeTile') and Session.equals('appState','view')
    #      log 'Setting something..'
        #  log Session.get('activeTile')
          #toggleTile($('#' + Session.get('activeTile'))[0])
    #      Meteor.Router.to('/' + Session.get('activeTile') + '/' + Session.get('appState'))
          #toggleTile($('#' + Session.get('activeTile'))[0],Session.get('activeTile'))
          #$('.paneWrapper').attr('data-state','profile')
  #)
    #$('.tileWrapper').removeClass('expanded')
  #console.console.log 'APPSTATE CHANGED!'
  #console.console.log Session.get('appState')
  #If there's an appState, route the user to that page.
  #if Session.get('appState')
  #Find out if a tile is currently selected and parse the game result to become a friendly url
  #Meteor.startup(()->
  #  if Session.get('appState') || Session.get('activeTile')
  #    activeTile = if Session.equals('activeTile',null) then '' else '/' + Games.findOne(Session.get('activeTile')).name.replace(/\s/g, '-').toLowerCase()
  #    log 'activeTile'
  #    log activeTile
  #    #Determine the application state and update the url accordingly
  #if Session.get('appState')
    #appState = if Session.equals('appState',null) then '' else '/' + Session.get('appState').toLowerCase()
  #    log 'appState'
  #    log appState
      #Build the URL
    #Meteor.Router.to(appState)
  #)
  )
)

#Handle different application states
Meteor.Router.add
  #Browse State
  "/":
    to: "main"
    and: () ->
      log 'MAIN PAGE'
      if Session.equals('appState',undefined)
        Session.set('appState','browse')
  #Preview State
  "/:_preview":
    to: "main"
    and: (preview) ->
      log 'VIEWING PREVIEW STATE'
      #log 'ID PAGE STUFF'
      #log preview
      if Session.equals('appState',undefined)
        Session.set('appState','preview')
      if Session.equals('activeTile',undefined)
        Session.set('activeTile',preview)
  #View State
  "/:_preview/view":
    to: "main"
    and: (preview) ->
      log 'VIEWING VIEW STATE'
      log preview
      if Session.equals('appState',undefined)
        Session.set('appState','view')
      if Session.equals('activeTile',undefined)
        Session.set('activeTile',preview)
  #Play State
  "/:_preview/view/play":
    to: "main"
    and: (preview) ->
      log 'VIEWING PLAY STATE'
      log preview
      if Session.equals('appState',undefined)
        Session.set('appState','play')
      if Session.equals('activeTile',undefined)
        Session.set('activeTile',preview)