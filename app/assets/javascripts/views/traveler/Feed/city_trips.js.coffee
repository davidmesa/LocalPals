class LocalPals.Views.CityTrips extends Backbone.View

  render: ->
    $(@el).html('<h1>Loading</h1>')
    @

  renderLlegada: ->
    $(@el).html('')
    @childViews = []
    @collection.forEach(@renderPost, @)
    @manejarTamanoFeed()
    @

  renderPost: (model) ->
    v = new LocalPals.Views.CityTrip({ model: model })
    @childViews.push(v)
    @$el.append(v.render().el)
