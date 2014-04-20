class LocalPals.Routers.MainRouter extends Backbone.Router

  routes:
    '': 'index'
    'activities': 'activities'
    'addcity':'addcity'
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

  activities: ->
    @headerView()
    @sidebarView()
    view = new LocalPals.Views.LocalIndex({collection: new LocalPals.Collections.Activities()})
    $('#container').html(view.render().el)



  addcity: ->
    @headerView()
    @sidebarView()
    view = new LocalPals.Views.TravelerCity({collection: new LocalPals.Collections.Cities})
    $('#container').html(view.render().el)
