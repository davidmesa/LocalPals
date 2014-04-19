class LocalPals.Routers.MainRouter extends Backbone.Router

  routes:
    '': 'index'
    'feed' : 'feed'

  initialize: ->
    @listenTo LocalPals.Vent, "registration", @registration
    @listenTo LocalPals.Vent, "login", @login

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
    Backbone.history.navigate("/users/new")
    registrationView = new LocalPals.Views.Registration()
    $('#container').html(registrationView.render().el)

  login: ->
    Backbone.history.navigate("/feed")
    @feed()

  feed: ->
    @sidebarView()
    @headerView()
    view = new LocalPals.Views.Feed()
    $('#container').html(view.render().el)