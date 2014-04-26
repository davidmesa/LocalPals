class LocalPals.Views.HeaderRightSignedIn extends Backbone.View

  template: JST['bars/header_right_signedin']

  initialize: ->

  setUser: (user) ->
    @user = user

  render: ->
    $(@el).html(@template())
    @$('#nombre').html(@user.attributes.name)
    @