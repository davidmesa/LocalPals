class LocalPals.Views.ActivityDetails extends Backbone.View

  template: JST['local/activity_details']

  initialize: ->
    @listenTo @model, "sync", @render
    @model.fetch()

  render: ->
    $(@el).html(@template({model: @model.attributes}))
    @