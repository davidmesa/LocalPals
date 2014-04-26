class LocalPals.Views.Sidebar extends Backbone.View

  template: JST['bars/sidebar']

  events:
    "click #activities": "showActivities"

  initialize: ->
    @listenTo LocalPals.Vent, "GoHome", @leaveSidebar

  leaveSidebar: ->
    @remove
    @off

  render: ->
    $(@el).html(@template())
    @

  showActivities: (e) ->
    e.preventDefault()
    LocalPals.Vent.trigger "show:activities"