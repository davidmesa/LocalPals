class LocalPals.Views.LocalHeader1 extends Backbone.View

  template: JST['signed-in/local/local_header']

  render: ->
    @user = @model
    @user.fetch({ error: @onErrorUser, success: @okSuccess})
    $(@el).html(@template())
    @

  okSuccess: (model) ->
    @$('nombre').html(model.attributes.name)
