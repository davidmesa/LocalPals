class LocalPals.Views.MainView extends Backbone.View

  template: JST['main_view']

  initialize: ->
    @listenTo LocalPals.Vent, "registration", @swapToRegistration
    @listenTo LocalPals.Vent, "login", @swapToFeed(new LocalPals.Models.UserLogin())
    @listenTo LocalPals.Vent, "register", @swapToFeed(new LocalPals.Models.UserRegistration())

  render: (contentView) ->
    $(@el).html(@template())
    console.log('render main')
    if(@signedIn)
      @renderSignedInHeader()
      console.log('render signin')
    else
      @renderHomeHeader()
      console.log('render home')
    @renderContent(contentView)
    @

  renderHomeHeader: ->
    @renderHeader(new LocalPals.Views.HeaderRightHome())

  renderSignedInHeader: ->
    @renderHeader(new LocalPals.Views.HeaderRightSignedIn())

  renderHeader: (rightHeaderView) ->
    @currentHeaderView.remove() if(@currentHeaderView)
    @currentHeaderView = new LocalPals.Views.Header()
    @$('#header').append(@currentHeaderView.render(rightHeaderView).el)

  renderContent: (contentView, mainView) ->
    @currentContentView.remove() if (@currentContentView)
    @currentContentView = contentView
    @$('#content').append(@currentContentView.render(mainView).el)

  swapToRegistration: ->
    @renderContent(new LocalPals.Views.Registration())

  swapToFeed: (user) ->
    @renderHeader(new LocalPals.Views.HeaderRightSignedIn({user: user}))
    mainView = new LocalPals.Views.Feed()
    contentView = new LocalPals.Views.SignedInMainView({user: user})
    @renderContent(contentView, mainView)
