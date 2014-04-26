class LocalPals.Views.ImageDetails extends Backbone.View

  template: JST['bars/local_header/details_image']

  setUser: (user) ->
    @user = user

  render: ->
    $(@el).html(@template())
    @$('nombre').html(@user.attributes.name)
    @