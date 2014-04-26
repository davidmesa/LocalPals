class LocalPals.Views.ImageDetails extends Backbone.View

  template: JST['bars/local_header/details_image']

  initialize: ->
    @listenTo @model, "sync", @render
    @model.fetch()

  render: ->
    $(@el).html(@template({model: @model.attributes}))
    @