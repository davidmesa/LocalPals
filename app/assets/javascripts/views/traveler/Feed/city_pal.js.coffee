class LocalPals.Views.CityPal extends Backbone.View

  className: "imagen"

  template: JST['traveler/feed/pal']

  events:
    "click #activityDetails": "activityDetails"

  initialize: ->
    @listenTo LocalPals.Vent, 'activity:traveler:show', @removeFeed

  activityDetails: (e) ->
    e.preventDefault()
    LocalPals.Vent.trigger('activity:traveler:show')


  removeFeed: ->
    @remove()
    @unbind()

  render: ->
    @$el.html(@template({model: @model}))
    @