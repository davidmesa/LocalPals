class LocalPals.Collections.FeedCityTrips extends Backbone.Collection
  model: LocalPals.Models.FeedCityTrip

  url: "/traveler/feed"


class LocalPals.Collections.Reviews extends Backbone.Collection
  model: LocalPals.Models.Review

  url: "/traveler/review"