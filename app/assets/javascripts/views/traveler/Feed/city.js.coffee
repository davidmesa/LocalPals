class LocalPals.Views.TravelerCity extends Backbone.View

  template: JST['traveler/feed/city']

  initialize: ->


  render: ->
    $(@el).html(@template())
    @
