class LocalPals.Views.LocalIndex extends Backbone.View

  template: JST['local/index']

  events:
    "click #new_activity": "newActivity"

  initialize: ->
    @listenTo @collection, "reset", @render
    @listenTo LocalPals.Vent, "project:create", @addToCollection
    @listenTo @collection,"add", @renderActivity
    @collection.fetch({reset: true})


  render: ->
    $(@el).html(@template())
    @localHeaderView()
    console.log(@collection.size())
    @collection.forEach(@renderActivity, @)
    @

  localHeaderView: ->
    v = new LocalPals.Views.LocalHeader({ model: new LocalPals.Models.User() })
    @$('#activity-header').append(v.render().el)

  renderActivity: (model) ->
    console.log(model)
    v = new LocalPals.Views.LocalActivity({ model: model })
    @$('#local-activities').append(v.render().el)
    console.log("render activity")

  newActivity: ->

  addToCollection: (model) ->
    @collection.add model


