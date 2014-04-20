class LocalPals.Views.Header extends Backbone.View

  template: JST['layout/header']

  events:
    "click #login": "login"

  render: ->
    $(@el).html(@template())
    @

  login: (e) ->
    e.preventDefault()
    console.log("login")
    @model = new LocalPals.Models.UserLogin()
    @model.set login: @$('#email').val()
    @model.set password: @$('#password').val()
    @model.save {},
      success: (model) -> LocalPals.Vent.trigger "login", model