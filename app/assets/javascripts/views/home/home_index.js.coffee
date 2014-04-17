class LocalPals.Views.HomeIndex extends Backbone.View

  template: JST['home/index']

  render: ->
    $(@el).html(@template())
    @
