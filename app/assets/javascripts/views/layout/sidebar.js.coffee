class LocalPals.Views.Sidebar extends Backbone.View

  template: JST['layout/sidebar']

  render: ->
    $(@el).html(@template())
    @