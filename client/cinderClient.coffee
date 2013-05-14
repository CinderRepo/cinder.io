Meteor.startup(()->
  console.log 'Hello Client!'
  #Set Session variables
  Session.set('activeModal',undefined)
  Session.set('activePane','browse')
  Session.set('revealedDown',false)
  Session.set('revealedDownHeight',undefined)

  #logRenders()
  Meteor.setTimeout(()->
      initGrid()
  1000)
)

logRenders = ->
  _.each Template, (template, name) ->
    oldRender = template.rendered
    counter = 0
    template.rendered = ->
      console.log name, "render count: ", ++counter
      oldRender and oldRender.apply(this, arguments_)

initGrid = () ->
  tiles = $('#tiles')[0]
  @grid = new Packery(tiles, {
    containerStyle: null
    columnWidth: '.tileWrapper'
    transitionDuration: '0.768s'
    #gutter: 10
  })
  grid.on('layoutComplete', (grid, whatever) ->
    #log 'LAYOUT COMPLETED'
    #log grid
    #log whatever
  )
  log 'Grid inited!'