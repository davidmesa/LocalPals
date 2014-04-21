class LocalPals.Views.CityPal extends Backbone.View

  className: "imagen col-md-4"

  template: JST['traveler/feed/pal']

  removeFeed: ->
    @remove()
    @unbind()

  render: ->
    console.log("Entra y carga")
    @$el.html(@template({model: @model}))
    @