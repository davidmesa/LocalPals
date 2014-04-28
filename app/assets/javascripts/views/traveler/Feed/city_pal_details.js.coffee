class LocalPals.Views.CityPalDetails extends Backbone.View

  template: JST['traveler/feed/city_pal_details']

  events:
    "click #btn-going": "addActivity"

  render: ->
    console.log(@model)
    @$el.html(@template({model: @model}))
    @

  addActivity: (e) ->
    e.preventDefault()
    model = new LocalPals.Models.AddActivity
    model.fetch({ data: $.param({ activity_id: @model.activity.id, city_id: @model.city_trip.id}) })

