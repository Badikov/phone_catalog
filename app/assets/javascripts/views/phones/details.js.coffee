class PhoneCatalog.Views.PhoneDetails extends Backbone.View

  id: "phone-details"

  className: "tab-pane fade"

  template: JST["phones/details"]
  propertyTemplate: JST["phones/_property"]

  initialize: ->
    _.extend this, PhoneCatalog.Utils.BootstrapTab

  render: ->
    $(@el).html(@template(phone: @model, propertyPartial: @propertyTemplate))
    @

  setPhone: (phone) ->
    @model = phone
    @model.on("change", @render, @)