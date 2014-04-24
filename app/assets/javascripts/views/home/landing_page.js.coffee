class LocalPals.Views.LandingPage extends Backbone.View

  template: JST['home/index']

  events:
    "click #registration": "registration"

  initialize: ->
    @listenTo LocalPals.Vent, "registration", @leaveIndex
    @listenTo LocalPals.Vent, "RemoveHome", @leaveIndex

  leaveIndex: ->
    console.log("Remueve Home")
    @remove
    @off


  render: ->
    $(@el).html(@template())
    @

  registration: (e) ->
    e.preventDefault()
    LocalPals.Vent.trigger('registration')
