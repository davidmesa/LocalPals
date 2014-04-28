class LocalPals.Views.CityTrips extends Backbone.View

  initialize: ->
    @listenTo @collection, "reset", @renderLlegada
    if @collection.constructor.name == 'SearchFeed'
       @renderLlegada()
    else
      @collection.fetch({reset: true})

  removeFeed: ->
    _.each @childViews, (childView) ->
      childView.removeFeed()  if childView.removeFeed
    @remove()
    @unbind()

  render: ->
    $(@el).html('<h1>Loading</h1>')
    if @collection.constructor.name == 'SearchFeed'
      @renderLlegada()
    @

  renderLlegada: ->
    $(@el).html('')
    @childViews = []
    @collection.forEach(@renderPost, @)
    @

  renderPost: (model) ->
    console.log("Entra a renderizar post")
    v = new LocalPals.Views.CityTrip({ model: model })
    @childViews.push(v)
    @$el.append(v.render().el)
    console.log(@$el)
