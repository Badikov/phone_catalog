class PhoneCatalog.Views.PhoneDetails extends PhoneCatalog.Views.FadingView

  template: JST["phones/details"]

  initialize: ->
    super

  render: ->
    @$el.html(@template(phone: @model))
    @

  setPhone: (phone) ->
    @model = phone
    @model.on("change", @render, @)