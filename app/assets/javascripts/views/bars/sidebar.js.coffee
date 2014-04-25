class LocalPals.Views.Sidebar extends Backbone.View

  template: JST['bars/sidebar']

  events:
    "click #sideProfile": "sideProfile"
    "click #sideActivities": "sideActivities"
    "click #sideFeed": "sideFeed"
    "click #sideTrips": "sideTrips"
    "click #sideSearch": "sideSearch"

  initialize: ->

  leaveSidebar: ->
    @remove()
    @unbind()

  render: ->
    $(@el).html(@template())
    @

  sideProfile: (e) ->
    e.preventDefault()
    console.log "EntraPerfil"
    LocalPals.Vent.trigger("renderMain", new LocalPals.Views.LocalIndex())

  sideActivities: (e) ->
    e.preventDefault()
    console.log "EntraActivities"

  sideFeed: (e) ->
    e.preventDefault()
    console.log "EntraFeed"
    LocalPals.Vent.trigger("renderMain", new LocalPals.Views.Feed())

  sideTrips: (e) ->
    e.preventDefault()
    console.log("EntraTrips")

  sideSearch: (e) ->
    e.preventDefault()
    console.log("EntraSearch")