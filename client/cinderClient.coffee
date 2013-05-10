Meteor.startup(()->
  console.log 'Hello Client!'
  #Set Session variables
  Session.set('activeModal',undefined)
  Session.set('activePane','browse')
  Session.set('revealedDown',false)
  Session.set('revealedDownHeight',undefined)

  logRenders()
)

logRenders = ->
  _.each Template, (template, name) ->
    oldRender = template.rendered
    counter = 0
    template.rendered = ->
      console.log name, "render count: ", ++counter
      oldRender and oldRender.apply(this, arguments_)
