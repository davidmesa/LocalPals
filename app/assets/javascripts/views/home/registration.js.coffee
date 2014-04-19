class LocalPals.Views.Registration extends Backbone.View

  template: JST['home/registration']

  render: ->
    $(@el).html(@template())
    @