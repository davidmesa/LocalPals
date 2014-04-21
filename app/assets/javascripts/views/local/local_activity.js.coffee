class LocalPals.Views.LocalActivity extends Backbone.View

  template: JST['local/activity']

  events:
    "click #showDetails": "showDetails"

  render: ->
    console.log('Render actividad')
    $(@el).html(@template({model: @model.attributes}))
    @

  showDetails: (e) ->
    e.preventDefault()
    LocalPals.Vent.trigger "activity:show", @model
    Backbone.history.navigate("activities/" + @model.id)