class LocalPals.Views.Registration extends Backbone.View

  template: JST['home/registration']

  events:
    "click #register": "register"

  render: ->
    $(@el).html(@template())
    @

  register: (e) ->
    e.preventDefault()
    @model = new LocalPals.Models.UserRegistration()
    @model.set login: @$('#email').val()
    @model.set password: @$('#password').val()
    @model.set confirm_password: @$('#confirm_password').val()
    @model.set name: @$('#first_name').val() + " " + @$('#last_name').val()
    @model.set university: @$('#university').val()
    @model.set birthday: @$('#birthday').val()
    @model.set city: @$('#city').val()
    @model.set about_me: @$('#about_me').val()
    @model.set hobbies: @$('#hobbies').val()
    @model.set interests: @convertObject()
    console.log @model.toJSON()
    @model.save {},
      success: (model) -> LocalPals.Vent.trigger "login", model

  convertObject: ->
    paramObj = []
    $.each $("form").serializeArray(), (_, kv) ->
      if kv.name != 'languages'
        paramObj.push(kv.name)
    return paramObj

