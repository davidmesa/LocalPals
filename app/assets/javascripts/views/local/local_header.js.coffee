class LocalPals.Views.LocalHeader extends Backbone.View

  template: JST['local/local_header']

  initialize: ->
    @model.fetch()

  render: ->
    console.log(@model.toJSON())
    $(@el).html(@template({model: @model.attributes}))
    @