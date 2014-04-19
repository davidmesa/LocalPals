class LocalPals.Views.Feed extends Backbone.View

  template: JST['traveler/feed/index']


  render: ->
    $(@el).html(@template())
    @includeCityTrips()
    @

  includeCityTrips: ->
    @currentPostView.close() if(@currentPostView)
    @currentPostView = new LocalPals.Views.CityTrips({collection: new LocalPals.Collections.FeedCityTrips()})
    @$('#cities').append(@currentPostView.render().el)


