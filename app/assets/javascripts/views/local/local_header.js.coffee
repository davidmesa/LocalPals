class LocalPals.Views.LocalHeader extends Backbone.View

  template: JST['local/local_header']

  render: ->
    @user = @model
    @user.fetch({ error: @onErrorUser, success: @okSuccess})
    $(@el).html(@template())
    @

  okSuccess: (model) ->
    @$('nombre').html(model.attributes.name)
