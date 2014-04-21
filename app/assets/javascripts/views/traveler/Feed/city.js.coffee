class LocalPals.Views.TravelerCity extends Backbone.View

  template: JST['traveler/feed/city']

  events:
    "click #agregarciudad": "agregarCiudad"

  initialize: ->
    @listenTo LocalPals.Vent, 'login', @removeAdd

  removeAdd: ->
    @remove()
    @unbind()

  agregarCiudad: (e) ->
    e.preventDefault()
    model = new LocalPals.Models.AddCity()
    model = @getinfo(model)
    model.fetch()
    LocalPals.Vent.trigger('login')

  render: ->
    $(@el).html(@template())
    @

  getinfo: (model) ->
    $.each $("form").serializeArray(), (_, kv) ->
      model.set(kv.name, kv.value)
    return model
