class LocalPals.Views.AttendingTraveler extends Backbone.View

  template: JST['signed-in/local/attending_traveler']

  render: ->
    $(@el).html(@template({model: @model}))
    @