class LocalPals.Views.CityTrip extends Backbone.View
  className: "city-info row"

  template: JST['traveler/feed/city_trip']

  initialize: ->
    @childViews = []
    @city_pals = @model.attributes[1]
    console.log(@city_pals)
    @city_pals.forEach(@renderCityPals, @)

  render: ->
    @$el.html(@template({model: @model.attributes}))
    @

  renderCityPals: (model) ->
    v = new LocalPals.Views.CityPal({ model: model })
    @childViews.push(v)
    @$el.append(v.render().el)
