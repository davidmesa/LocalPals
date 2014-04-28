class LocalPals.Views.LocalMain extends Backbone.View

  template: JST['signed-in/local/local_main']

  initialize: ->
    @listenTo LocalPals.Vent, "new:activity", @swapToNewActivity
    @listenTo LocalPals.Vent, "show:activity", @swapToShowActivity
    @listenTo LocalPals.Vent, "activity:create", @swapToLocalIndex


  setUser: (user) ->
    @user = user
    console.log('setea user')

  render: ->
    $(@el).html(@template())
    @renderContent(@localMainContent)
    @renderHeader(@headerImage)
    console.log('entra a render local main')
    @

  initViews: (localMainContent, headerImageView) ->
    console.log('entra a init')
    @localMainContent = localMainContent
    @headerImage = headerImageView

  renderContent: (contentView) ->
    console.log('entra a renderContent')
    @currentContentView.remove() if(@currentContentView)
    @currentContentView = contentView
    @$('#local-activity-container').append(@currentContentView.render().el)

  renderHeader: (headerImage) ->
    console.log('entra a renderHeader')
    @currentHeaderView.remove() if(@currentHeaderView)
    @currentHeaderView = new LocalPals.Views.LocalHeader()
    @currentHeaderView.setUser(@user)
    @$('#activity-header').append(@currentHeaderView.render(headerImage).el)

  swapToNewActivity: ->
    newActivityHeader = new LocalPals.Views.ImageNew()
    newActivityHeader.setUser(@user)
    @renderHeader(newActivityHeader)
    newActivityView = new LocalPals.Views.NewActivity({model: new LocalPals.Models.Activity()})
    @renderContent(newActivityView)

  swapToShowActivity: (model) ->
    activityDetailHeader = new LocalPals.Views.ImageDetails({ model: model })
    @renderHeader(activityDetailHeader)
    console.log('MODELO SHOW ACTIVITY:')
    console.log(model.toJSON())
    activityDetailsView = new LocalPals.Views.ActivityDetails({ model: model})
    @renderContent(activityDetailsView)

  swapToLocalIndex: ->
    localHeaderView = new LocalPals.Views.ImageIndex()
    localHeaderView.setUser(@user)
    @renderHeader(localHeaderView)
    localMainContent = new LocalPals.Views.LocalIndex({collection: new LocalPals.Collections.Activities()})
    @renderContent(localMainContent)