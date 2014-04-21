class LocalPals.Views.HeaderSession extends Backbone.View

  template: JST['layout/header_session']

  initialize: ->
    @listenTo LocalPals.Vent, "GoHome", @leaveHeader
    @user = new LocalPals.Models.User()
    @user.fetch({ error: @onErrorUser, success: @okSuccess})

  onErrorUser: ->

  okSuccess: (model) ->
    @$('#nombre').html(model.attributes.name)

  leaveHeader: ->
    @remove
    @off

  render: ->
    $(@el).html(@template())
    @