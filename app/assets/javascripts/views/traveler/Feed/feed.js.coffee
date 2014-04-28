class LocalPals.Views.Feed extends Backbone.View

  template: JST['traveler/feed/index']

  events:
    "click #add_city": "addCity"

  initialize: ->
    @listenTo LocalPals.Vent, "addCity", @removeFeed
    @listenTo LocalPals.Vent, "displaySearch", @displaySeach

  removeFeed: ->
    @currentPostView.removeFeed()
    @remove
    @unbind

  render: ->
    $(@el).html(@template())
    @includeCityTrips()
    @

  addCity: (e) ->
    e.preventDefault()
    LocalPals.Vent.trigger("addCity")

  includeCityTrips: ->
    @currentPostView.close() if(@currentPostView)
    @currentPostView = new LocalPals.Views.CityTrips({collection: new LocalPals.Collections.FeedCityTrips()})
    @$('#cities').append(@currentPostView.render().el)

  displaySeach: (collection) ->
    @currentPostView.removeFeed() if(@currentPostView)
    @currentPostView = new LocalPals.Views.CityTrips({collection: collection})
    console.log(@currentPostView.render().el)
    @$('#cities').append(@currentPostView.render().el)
