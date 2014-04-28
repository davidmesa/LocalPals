class LocalPals.Views.CityPalReview extends Backbone.View

  template: JST['traveler/feed/city_pal_review']

  render: ->
    console.log(@model.travelerImg)
    $(@el).html(@template({model: @model}))
    @