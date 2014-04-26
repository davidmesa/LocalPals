class LocalPals.Views.ActivityHeader extends Backbone.View

  template: JST['signed-in/local/activity_header']

  render: ->
    @user = @model
    @user.fetch({ error: @onErrorUser, success: @okSuccess})
    $(@el).html(@template())
    @

  okSuccess: (model) ->
    @$('nombre').html(model.attributes.name)