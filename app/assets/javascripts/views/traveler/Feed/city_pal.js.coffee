class LocalPals.Views.FeedPost extends Backbone.View

  className: "imagen"

  template: JST['traveler/feed/pal']

  render: ->
    @$el.html(@template({model: @model.attributes}))
    @