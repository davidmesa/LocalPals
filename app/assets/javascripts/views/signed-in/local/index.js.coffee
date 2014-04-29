class LocalPals.Views.LocalIndex extends Backbone.View

  template: JST['signed-in/local/index']

  events:
    "click #new_activity": "newActivity"

  initialize: ->
    @listenTo @collection, "reset", @render
    @listenTo LocalPals.Vent, "activity:create", @addToCollection
    @listenTo @collection,"add", @renderActivity
    @collection.fetch({reset: true})


  render: ->
    $(@el).html(@template())
    console.log(@collection.size())
    @collection.forEach(@renderActivity, @)
    @

  renderActivity: (model) ->
    console.log(model.toJSON())
    v = new LocalPals.Views.LocalActivity({ model: model })
    @$('#local-activities').append(v.render().el)
    console.log("render activity")

  newActivity: (e) ->
    e.preventDefault()
    LocalPals.Vent.trigger "new:activity"
    Backbone.history.navigate("activities/new")

  addToCollection: (model) ->
    @collection.add model


