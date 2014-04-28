class LocalPals.Views.CityTrip extends Backbone.View
  className: "city-info row"

  template: JST['traveler/feed/city_trip']

  initialize: ->
    @childViews = []
    @city_pals = @model.attributes[1]
    @city_pals.forEach(@renderCityPals, @)

  removeFeed: ->
    @remove()
    @unbind()
    _.each @childViews, (childView) ->
      childView.removeFeed()  if childView.removeFeed

  render: ->
    console.log("Entra a render")
    console.log(@model.attributes)
    @$el.html(@template({model: @model.attributes}))
    @childViews = []
    @city_pals = @model.attributes[1]
    @city_pals.forEach(@renderCityPals, @)
    @

  renderCityPals: (model) ->
    v = new LocalPals.Views.CityPal({ model: model })
    @childViews.push(v)
    @$('.pals').append(v.render().el)
