class LocalPals.Routers.MainRouter extends Backbone.Router

  routes:
    '': 'index'

  initialize: ->

  index: ->
    @headerView()
    view = new LocalPals.Views.HomeIndex()
    $('#container').html(view.render.el)

  headerView: ->
    headerView = new LocalPals.Views.Header
    $('#header').html(headerView.render().el)