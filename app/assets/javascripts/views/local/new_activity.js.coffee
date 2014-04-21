class LocalPals.Views.NewActivity extends Backbone.View

  template: JST['local/new_activity']

  events:
    'click #submit': 'saveActivity'

  render: ->
    $(@el).html(@template({model: @model.attributes}))
    @activityHeaderView()
    @

  activityHeaderView: ->
    v = new LocalPals.Views.ActivityHeader({ model: new LocalPals.Models.User() })
    @$('#activity-header').append(v.render().el)

  saveActivity: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.set description: @$('#description').val()
    @model.set address: @$('#address').val()
    @model.set img: @$('#img-url').val()
    @model.set start_date: @$('#starts').val()
    @model.set end_date: @$('#ends').val()
    @model.set interests: @convertObject()
    @model.save {},
      success: (model) -> LocalPals.Vent.trigger "activity:create", model

  convertObject: ->
    paramObj = []
    $.each $("form").serializeArray(), (_, kv) ->
      if kv.name != 'languages'
        paramObj.push(kv.name)
    return paramObj