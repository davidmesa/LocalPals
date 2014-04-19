class LocalPals.Views.HomeIndex extends Backbone.View

  template: JST['home/index']

  events:
    "click #register": "register"

  render: ->
    $(@el).html(@template())
    @

  register: (e) ->
    e.preventDefault()
    LocalPals.Vent.trigger('register')