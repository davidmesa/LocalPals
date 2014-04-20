class LocalPals.Views.LocalIndex extends Backbone.View

  template: JST['local/index']

  events:
    "click #new_activity": "newActivity"

  initialize: ->
    @listenTo @collection, "reset", @render
    @listenTo LocalPals.Vent, "project:create", @addToCollection
    @listenTo @collection,"add", @renderActivity
    @collection.fetch({reset: true})
    @model.fetch()

  render: ->
    $(@el).html(@template({model: @model.attributes}))
    console.log(@collection.size())
    console.log(@model.toJSON())
    @collection.forEach(@renderActivity, @)
    @

  renderActivity: (model) ->
    console.log(model)
    v = new LocalPals.Views.LocalActivity({ model: model })
    @$('#local-activities').append(v.render().el)
    console.log("render activity")

  newActivity: ->

  addToCollection: (model) ->
    @collection.add model
