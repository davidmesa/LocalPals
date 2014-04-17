class LocalPals.View.Header extends Backbone.View

  template: JST['header/index']

  render: ->
    $(@el).html(@template())
    @

