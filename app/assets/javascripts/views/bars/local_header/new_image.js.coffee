class LocalPals.Views.ImageNew extends Backbone.View

  template: JST['bars/local_header/new_image']

  setUser: (user) ->
    @user = user

  render: ->
    $(@el).html(@template({model: @user.attributes}))
    @