class PhoneCatalog.Views.PhoneDetails extends PhoneCatalog.Views.FadingView

  id: "details"

  template: JST["phones/details"]

  events:
    "click .breadcrumb a": "navigate"

  initialize: ->
    super
    _.extend(@, PhoneCatalog.Views.Navigable)

  render: ->
    @$el.html(@template(phone: @model))
    @

  setPhone: (phone) ->
    @model = phone
    @model.on("change", @render, @)