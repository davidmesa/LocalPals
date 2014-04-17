class LocalPals.Views.Header extends Backbone.View

  template: JST['header/index']

  render: ->
    $(@el).html(@template())
    @

