class LocalPals.Views.TravelerCity extends Backbone.View

  template: JST['traveler/feed/city']

  events:
    "click #addCityFeed": "addCityFeed"

  initialize: ->
    @listenTo LocalPals.Vent, 'renderMain', @removeAdd

  removeAdd: ->
    @remove()
    @unbind()

  addCityFeed: (e) ->
    e.preventDefault()
    model = new LocalPals.Models.AddCity()
    @getinfo(model)
    model.set city: @$('#City').val().replace /^\s+|\s+$/g, ""
    model.save()
    LocalPals.Vent.trigger("renderMain", new LocalPals.Views.Feed())

  render: ->
    $(@el).html(@template())
    @

  getinfo: (model) ->
    $.each $("form").serializeArray(), (_, kv) ->
      model.set(kv.name, kv.value)