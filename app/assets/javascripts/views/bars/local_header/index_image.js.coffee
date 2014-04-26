class LocalPals.Views.ImageIndex extends Backbone.View

  template: JST['bars/local_header/index_image']

  setUser: (user) ->
    @user = user

  render: ->
    $(@el).html(@template())
    @$('nombre').html(@user.attributes.name)
    @