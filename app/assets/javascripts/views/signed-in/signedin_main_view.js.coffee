class LocalPals.Views.SignedInMainView extends Backbone.View

  template: JST['signed-in/main_view']

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

