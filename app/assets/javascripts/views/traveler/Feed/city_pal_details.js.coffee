class LocalPals.Views.CityPalDetails extends Backbone.View

  template: JST['traveler/feed/city_pal_details']

  render: ->
    console.log(@model)
    @$el.html(@template({model: @model}))
    @