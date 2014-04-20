class LocalPals.Views.LocalIndex extends Backbone.View

  template: JST['local/index']

  events:
    "click #new_activity": "new_activity"

  initialize: ->
    @listenTo @collection, "reset", @render
    @collection.fetch({reset: true})

  render: ->
    $(@el).html(@template())
    console.log(@collection.size())
    @collection.forEach(@renderActivity, @)
    @

  renderActivity: (model) ->
    console.log(model)
    v = new LocalPals.Views.LocalActivity({ model: model })
    @$('#local-activities').append(v.render().el)
    console.log("render activity")

  new_activity: (e) ->
    e.preventDefault()
    LocalPals.Vent.trigger('new_activity')