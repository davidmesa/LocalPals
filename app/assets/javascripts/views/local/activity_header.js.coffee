class LocalPals.Views.ActivityHeader extends Backbone.View

  template: JST['local/activity_header']

  initialize: ->
    @model.fetch()

  render: ->
    console.log(@model.toJSON())
    $(@el).html(@template({model: @model.attributes}))
    @