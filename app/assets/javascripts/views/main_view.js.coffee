class LocalPals.Views.MainView extends Backbone.View

  template: JST['main_view']

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
    header = new LocalPals.Views.Header()
    @$('#header').append(header.render(rightHeaderView).el)

  renderContent: (contentView) ->
    @$('#content').append(contentView.render().el)

  registration: (e) ->
    e.preventDefault()
    LocalPals.Vent.trigger('registration')
