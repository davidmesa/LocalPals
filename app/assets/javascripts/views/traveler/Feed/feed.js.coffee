class LocalPals.Views.Feed extends Backbone.View

  template: JST['traveler/feed/index']

  render: ->
    $(@el).html(@template())
    @


