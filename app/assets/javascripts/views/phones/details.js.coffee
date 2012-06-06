class PhoneCatalog.Views.PhoneDetails extends Backbone.View

  id: "phone-details"

  className: "tab-pane fade"

  template: JST["phones/details"]

  initialize: ->
    _.extend this, PhoneCatalog.Utils.BootstrapTab

  render: ->
    $(@el).html(@template(phone: @model))
    @

  setPhone: (phone) ->
    @model = phone
    @model.on("change", @render, @)