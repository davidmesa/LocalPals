class LocalPals.Views.CityPalDetails extends Backbone.View

  template: JST['traveler/feed/city_pal_details']

  events:
    "click #btn-going": "addActivity"
    "click #submit-review": "addReview"

  initialize: ->
    @listenTo LocalPals.Vent, "review:create", @addToCollection
    @listenTo @collection, "reset", @render
    @listenTo @collection,"add", @renderReview
    @collection.fetch({reset: true, data: $.param({ activity_id: @model.activity.id})})

  render: ->
    console.log(@model)
    @$el.html(@template({model: @model}))
    @collection.forEach(@renderReview, @)
    @

  addActivity: (e) ->
    e.preventDefault()
    model = new LocalPals.Models.AddActivity
    model.fetch({ data: $.param({ activity_id: @model.activity.id, city_id: @model.city_trip.id}) })

  addReview: (e) ->
    e.preventDefault()
    model = new LocalPals.Models.AddReview
    model.set local_id: @model.local.id
    model.set comment: @$('#comment').val()
    model.save {},
      success: (model) -> LocalPals.Vent.trigger "review:create", model


  renderReview: (model) ->
    console.log('renderrrr review')
    console.log(model.toJSON())
    v = new LocalPals.Views.CityPalReview({ model: model })
    @$('#reviews-local').append(v.render().el)

  addToCollection: (model) ->
    @collection.add model


