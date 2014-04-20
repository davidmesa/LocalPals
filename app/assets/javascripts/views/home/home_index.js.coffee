class LocalPals.Views.HomeIndex extends Backbone.View

  template: JST['home/index']

  events:
    "click #registration": "registration"

  initialize: ->


  render: ->
    $(@el).html(@template())
    @

  registration: (e) ->
    e.preventDefault()
    LocalPals.Vent.trigger('registration')
