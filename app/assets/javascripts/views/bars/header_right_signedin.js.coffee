class LocalPals.Views.HeaderRightSignedIn extends Backbone.View

  template: JST['bars/header_right_signedin']

  events:
    "click #logout": "logout"

  initialize: ->
    @user = new LocalPals.Models.User()
    @user.fetch({ error: @onErrorUser, success: @okSuccess})

  onErrorUser: ->

  okSuccess: (model) ->
    @$('#nombre').html(model.attributes.name)

  render: ->
    $(@el).html(@template())
    @

  logout: ->
    console.log 'Entra a salir'