class LocalPals.Views.HeaderSession extends Backbone.View

  template: JST['layout/header_session']

  render: ->
    $(@el).html(@template())
    @