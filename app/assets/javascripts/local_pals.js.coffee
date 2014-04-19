window.LocalPals =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Vent: _.clone(Backbone.Events)
  initialize: ->
    new LocalPals.Routers.MainRouter()
    Backbone.history.start()

$(document).ready ->
  LocalPals.initialize()