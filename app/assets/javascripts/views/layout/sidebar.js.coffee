class LocalPals.Views.Sidebar extends Backbone.View

  template: JST['layout/sidebar']

  initialize: ->
    @listenTo LocalPals.Vent, "GoHome", @leaveSidebar

  leaveSidebar: ->
    @remove
    @off

  render: ->
    $(@el).html(@template())
    @