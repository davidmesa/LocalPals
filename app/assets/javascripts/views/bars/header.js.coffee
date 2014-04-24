class LocalPals.Views.Header extends Backbone.View

  template: JST['bars/header']

  initialize: ->
    @listenTo LocalPals.Vent, "RemoveHome", @leaveHeader

  leaveHeader: ->
    @remove
    @off

  render: (rightHeaderView) ->
    console.log('nuevo header')
    $(@el).html(@template())
    @$('#right-header').append(rightHeaderView.render().el)
    @