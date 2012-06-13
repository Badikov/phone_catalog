class PhoneCatalog.Views.PhonesIndex extends PhoneCatalog.Views.FadingView

  className: "row"

  template: JST['phones/index']

  initialize: ->
    super
    @collection = new PhoneCatalog.Collections.Phones()
    @collection.on("reset", @render, @)
    @collection.on("select", @selectPhone, @)

  render: ->
    @$el.html(@template())
    @collection.each(@appendPhone, @)
    @

  appendPhone: (phone) ->
    phoneView = new PhoneCatalog.Views.Phone(model: phone, collection: @collection)
    @$("#phones").append(phoneView.render().el)

  selectPhone: (phone) ->
    Backbone.history.navigate(phone.path(), {trigger: true})