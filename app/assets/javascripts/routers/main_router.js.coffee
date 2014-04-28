class LocalPals.Routers.MainRouter extends Backbone.Router

  routes:
    '': 'index'
    'users/new': 'registration'
    'activities': 'activities'
    'addcity':'agregarciudad'
    'activities/new': 'newActivity'
    'feed' : 'feed'
    'activities/:id': 'showActivity'

  initialize: ->
    #@listenTo LocalPals.Vent, "registration", @registration
    #@listenTo LocalPals.Vent, "addCity", @agregarciudad
    #@listenTo LocalPals.Vent, "login", @feed
    #@listenTo LocalPals.Vent, "activity:create", @activities
    #@listenTo LocalPals.Vent, "activity:show", @activityShow
    #@listenTo LocalPals.Vent, "activity:traveler:show", @activityTravelerDetails

  index: ->
    #LocalPals.Vent.trigger("GoHome")
    #@headerView() unless @basicHeader
    #view = new LocalPals.Views.LandingPage()
    #$('#container').html(view.render().el)
    console.log('entra a index en routers')
    view = new LocalPals.Views.MainView({signedIn: false})
    console.log('despues de new main view')
    $('#container').html(view.render(new LocalPals.Views.LandingPage()).el)


  #registration: ->
    #Backbone.history.navigate("/users/new")
    #@headerView() unless @basicHeader
    #registrationView = new LocalPals.Views.Registration()
    #$('#container').html(registrationView.render().el)

  feed: ->
    LocalPals.Vent.trigger("RemoveHome")
    Backbone.history.navigate("/feed")
    @headerSessionView() unless @sessionHeader
    @sidebarView() unless @sidebar
    view = new LocalPals.Views.Feed()
    $('#container').html(view.render().el)
    #view = new LocalPals.Views.MainView({signedIn: true})
    #$('#container').html(view.render().el)

  headerView: ->
    @basicHeader = new LocalPals.Views.Header2()
    $('#header').html(@basicHeader.render().el)

  headerSessionView: ->
    @sessionHeader = new LocalPals.Views.HeaderSession()
    $('#header').html(@sessionHeader.render().el)

  sidebarView: ->
    @sidebar = new LocalPals.Views.Sidebar()
    $('#sidebar').html(@sidebar.render().el)

  #agregarciudad: ->
  # Backbone.history.navigate("/addcity")
  #  cityview = new LocalPals.Views.TravelerCity()
  #  $('#container').html(cityview.render().el)

  loginLP: ->
    @feed()

  #activities: ->
    #@headerSessionView() unless @sessionHeader
    #@sidebarView() unless @sidebar
    #@swapContainer(new LocalPals.Views.LocalIndex({collection: new LocalPals.Collections.Activities()}))

  newActivity: ->
    @swapContainer(new LocalPals.Views.NewActivity({model: new LocalPals.Models.Activity()}))

  swapContainerToActivity: ->
    @swapContainer(new LocalPals.Views.LocalIndex({collection: new LocalPals.Collections.Activities()}))
    Backbone.history.navigate("/activities")

  swapContainer: (view) ->
    @currentContainerView.remove() if @currentContainerView
    @currentContainerView = view
    $('#container').html(@currentContainerView.render().el)

  activityShow: (model) ->
    @swapContainer(new LocalPals.Views.ActivityDetails({ model: model }))

  showActivity: (id) ->
    @headerView()
    @sidebarView()
    m = new LocalPals.Models.Activity({ id: id })
    @swapContainer(new LocalPals.Views.ActivityDetails({ model: m }))

  activityTravelerDetails: (model) ->
    @swapContainer(new LocalPals.Views.CityPalDetails({ model: model }))
