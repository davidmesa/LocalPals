window.LocalPals =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new LocalPals.Routers.MainRouter()
    Backbone.history.start()

$(document).ready ->
  LocalPals.initialize()
