class PhoneCatalog.Views.PhonesIndex extends Backbone.View

  id: "phones-index"
  className: "row tab-pane fade"

  template: JST['phones/index']

  initialize: ->
    _.extend this, PhoneCatalog.Utils.BootstrapTab
    @collection = new PhoneCatalog.Collections.Phones()
    @collection.on("reset", @render, @)
    @collection.on("select", @selectPhone, @)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendPhone, @)
    @

  appendPhone: (phone) ->
    phoneView = new PhoneCatalog.Views.Phone(model: phone, collection: @collection)
    @$("#phones").append(phoneView.render().el)

  selectPhone: (phone) ->
    Backbone.history.navigate("phones/#{phone.get('id')}", {trigger: true})