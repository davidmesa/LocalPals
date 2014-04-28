class LocalPals.Views.Sidebar extends Backbone.View

  template: JST['bars/sidebar']

  events:
    "click #activities": "showActivities"
    "click #sideProfile": "sideProfile"
    "click #sideFeed": "sideFeed"
    "click #sideTrips": "sideTrips"
    "click #sideSearch": "sideSearch"

  initialize: ->
    @listenTo LocalPals.Vent, "search", @loadSearch
    searchModel = new LocalPals.Models.BasicSearchInfo()
    searchModel.fetch({success: @addBasicInfo})

  leaveSidebar: ->
    @remove()
    @unbind()

  render: ->
    $(@el).html(@template())
    @

  showActivities: (e) ->
    e.preventDefault()
    LocalPals.Vent.trigger "show:activities"

  sideProfile: (e) ->
    e.preventDefault()
    console.log "EntraPerfil"
    LocalPals.Vent.trigger("renderMain", new LocalPals.Views.LocalIndex())

  sideFeed: (e) ->
    e.preventDefault()
    console.log "EntraFeed"
    LocalPals.Vent.trigger("renderMain", new LocalPals.Views.Feed())

  sideTrips: (e) ->
    e.preventDefault()
    console.log("EntraTrips")

  sideSearch: (e) ->
    e.preventDefault()
    model = new LocalPals.Collections.SearchFeed()
    console.log city: @$('#city option:selected').val()
    console.log category: @$('#category option:selected').val()
    model.fetch({
      data: {name: @$('#name').val(), city: @$('#city option:selected').val(), category: @$('#category option:selected').val()},
      success: (model)-> LocalPals.Vent.trigger 'search', model
    })

  addBasicInfo: (model) ->
    _.each model.attributes['cities'], (city) ->
      @$('#city').append('<option>'+city.name+'</option>')
    _.each model.attributes['categories'], (category) ->
      @$('#category').append('<option>'+category.name+'</option>')

  loadSearch: (model) ->
    LocalPals.Vent.trigger('displaySearch', model)