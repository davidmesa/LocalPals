class LocalPals.Views.LocalActivity extends Backbone.View

  template: JST['local/activity']

  render: ->
    console.log('Render actividad')
    $(@el).html(@template({model: @model.attributes}))
    @