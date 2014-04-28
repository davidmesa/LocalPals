class LocalPals.Views.ActivityDetails extends Backbone.View

  template: JST['signed-in/local/activity_details']

  initialize: ->
    @listenTo @model, "sync", @render
    @model.fetch()
    console.log("MODELO DETAILS: ")
    console.log(@model.toJSON())

  render: ->
    $(@el).html(@template({model: @model.attributes}))
    @model.attributes.attending.forEach(@renderAttending, @)
    @

  renderAttending: (model) ->
    v = new LocalPals.Views.AttendingTraveler({ model: model })
    @$('#attending-travelers').append(v.render().el)