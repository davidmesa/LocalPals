class LocalPals.Views.MainView extends Backbone.View

  template: JST['main_view']

  initialize: ->
    @listenTo LocalPals.Vent, "registration", @swapToRegistration
    @listenTo LocalPals.Vent, "login", @swapToFeed
    @listenTo LocalPals.Vent, "register", @swapToFeed

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
    @user = user
    console.log("USUARIO QUE HIZO LOGIN")
    console.log(@user.toJSON())
    header = new LocalPals.Views.HeaderRightSignedIn()
    header.setUser(user)
    @renderHeader(header)
    mainView = new LocalPals.Views.Feed()
    contentView = new LocalPals.Views.SignedInMainView()
    contentView.setUser(user)
    @renderContent(contentView, mainView)