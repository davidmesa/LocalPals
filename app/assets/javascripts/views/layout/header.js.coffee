class LocalPals.Views.Header extends Backbone.View

  template: JST['layout/header']

  render: ->
    $(@el).html(@template())
    @