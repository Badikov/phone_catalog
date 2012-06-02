class PhoneCatalog.Views.VendorsIndex extends Backbone.View

  className: "row"

  template: JST['vendors/index']

  initialize: ->
    @collection.on("reset", @render, @)

  render: ->
    $(@el).html(@template())
    @collection.each (vendor)->
      vendorView = new PhoneCatalog.Views.Vendor(model: vendor)
      @$("#vendors").append(vendorView.render().el)
    @