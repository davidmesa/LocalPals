class LocalPals.Views.SignedInMainView extends Backbone.View

  template: JST['signed-in/main_view']

  initialize: ->
    @listenTo LocalPals.Vent, 'addCity', @addCity

  addCity: ->
    @renderMain(new LocalPals.Views.TravelerCity())

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

