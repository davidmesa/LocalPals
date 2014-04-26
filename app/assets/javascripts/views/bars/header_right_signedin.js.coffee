class LocalPals.Views.HeaderRightSignedIn extends Backbone.View

  template: JST['bars/header_right_signedin']

  events:
    "click #logout": "logout"

  initialize: ->

  setUser: (user) ->
    @user = user

  render: ->
    console.log "Crea Header oosi"
    $(@el).html(@template())
    @$('#nombre').html(@user.attributes.user.name)
    @

  logout: ->
    console.log 'Entra a salir'
