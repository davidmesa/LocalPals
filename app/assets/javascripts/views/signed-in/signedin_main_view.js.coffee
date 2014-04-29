class LocalPals.Views.SignedInMainView extends Backbone.View

  template: JST['signed-in/main_view']

  initialize: ->
    @listenTo LocalPals.Vent, "show:activities", @swapToLocal
    @listenTo LocalPals.Vent, 'addCity', @addCity
    @listenTo LocalPals.Vent, "renderMain", @renderMain
    @listenTo LocalPals.Vent, "activity:traveler:show", @swapToFeedActivityDetails

  addCity: ->
    @renderMain(new LocalPals.Views.TravelerCity())

  setUser: (user) ->
    @user = user

  render: (mainView) ->
    $(@el).html(@template())
    @renderSideBar()
    @renderMain(mainView)
    @

  renderMain: (mainView) ->
    @currentMainView.remove() if(@currentMainView)
    @currentMainView = mainView
    @$('#main-view').append(@currentMainView.render().el)

  renderSideBar: ->
    @currentSidebarView.remove() if(@currentSidebarView)
    @currentSidebarView = new LocalPals.Views.Sidebar()
    @$('#sidebar').append(@currentSidebarView.render().el)

  swapToLocal: ->
    localMainView = new LocalPals.Views.LocalMain()
    localMainView.setUser(@user)
    localMainContent = new LocalPals.Views.LocalIndex({collection: new LocalPals.Collections.Activities()})
    localHeaderView = new LocalPals.Views.ImageIndex()
    localHeaderView.setUser(@user)
    localMainView.initViews(localMainContent, localHeaderView)
    @renderMain(localMainView)
    Backbone.history.navigate("activities/")
    #activitiesView = new LocalPals.Views.LocalIndex({collection: new LocalPals.Collections.Activities()})
    #@renderMain(activitiesView)

  swapToFeedActivityDetails: (model) ->
    activityDetailsView = new LocalPals.Views.CityPalDetails({ model: model,  collection: new LocalPals.Collections.Reviews })
    @renderMain(activityDetailsView)
