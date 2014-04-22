class LocalPals.Views.CityPal extends Backbone.View

  className: "imagen col-md-4"

  template: JST['traveler/feed/pal']

  events:
    "click #activityDetails": "activityDetails"

  initialize: ->
    @listenTo LocalPals.Vent, 'activity:traveler:show', @removeFeed

  activityDetails: (e) ->
    e.preventDefault()
    LocalPals.Vent.trigger 'activity:traveler:show', @model


  removeFeed: ->
    @remove()
    @unbind()

  render: ->
    console.log(@model)
    @$el.html(@template({model: @model}))
    @