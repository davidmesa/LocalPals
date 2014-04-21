class LocalPals.Views.CityPal extends Backbone.View

  className: "imagen"

  template: JST['traveler/feed/pal']

  removeFeed: ->
    @remove()
    @unbind()

  render: ->
    @$el.html(@template({model: @model}))
    @