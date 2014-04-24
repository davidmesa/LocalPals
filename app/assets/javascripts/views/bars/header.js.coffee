class LocalPals.Views.Header extends Backbone.View

  template: JST['bars/header']

  render: (rightHeaderView) ->
    console.log('nuevo header')
    $(@el).html(@template())
    @$('#right-header').append(rightHeaderView.render().el)
    @