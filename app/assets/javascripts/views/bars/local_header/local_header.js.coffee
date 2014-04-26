class LocalPals.Views.LocalHeader extends Backbone.View

  template: JST['bars/local_header/local_header']

  setUser: (user) ->
    @user = user

  render: (view) ->
    $(@el).html(@template())
    @$('#image-header-local').append(view.render().el)
    @$('nombre').html(@user.attributes.name)
    @