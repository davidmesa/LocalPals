class LocalPals.Routers.MainRouter extends Backbone.Router

  routes:
    '': 'index'
    'activities': 'activities'
    'activities/new': 'newActivity'
    'feed' : 'feed'

  initialize: ->
    @listenTo LocalPals.Vent, "registration", @registration
    @listenTo LocalPals.Vent, "login", @login
    @listenTo LocalPals.Vent, "activity:create", @activities

  index: ->
    @headerView()
    view = new LocalPals.Views.HomeIndex()
    $('#container').html(view.render().el)

  headerView: ->
    headerView = new LocalPals.Views.Header()
    $('#header').html(headerView.render().el)

  headerSessionView: ->
    headerSessionView = new LocalPals.Views.HeaderSession()
    $('#header').html(headerSessionView.render().el)

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
    @headerSessionView()
    view = new LocalPals.Views.Feed()
    $('#container').html(view.render().el)

  activities: ->
    @headerSessionView()
    @sidebarView()
    @swapContainer(new LocalPals.Views.LocalIndex({collection: new LocalPals.Collections.Activities(), model: new LocalPals.Models.User()}))

  newActivity: ->
    @swapContainer(new LocalPals.Views.NewActivity({model: new LocalPals.Models.Activity()}))

  swapContainerToActivity: ->
    @swapContainer(new LocalPals.Views.LocalIndex({collection: new LocalPals.Collections.Activities(), model: new LocalPals.Models.User()}))
    Backbone.history.navigate("/activities")

  swapContainer: (view) ->
    @currentContainerView.remove() if @currentContainerView
    @currentContainerView = view
    $('#container').html(@currentContainerView.render().el)
