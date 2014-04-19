class LocalPals.Routers.MainRouter extends Backbone.Router

  routes:
    '': 'index'

  initialize: ->
    @listenTo LocalPals.Vent, "register", @registration

  index: ->
    @headerView()
    view = new LocalPals.Views.HomeIndex()
    $('#container').html(view.render().el)

  headerView: ->
    headerView = new LocalPals.Views.Header()
    $('#header').html(headerView.render().el)

  sidebarView: ->
    sidebarView = new LocalPals.Views.Sidebar()
    $('#sidebar').html(sidebarView.render().el)

  registration: ->
    Backbone.history.navigate("/register")
    registrationView = new LocalPals.Views.Registration()
    $('#container').html(registrationView.render().el)