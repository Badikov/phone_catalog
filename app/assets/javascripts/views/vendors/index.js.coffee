class PhoneCatalog.Views.VendorsIndex extends Backbone.View

  className: "row"

  template: JST['vendors/index']

  initialize: ->
    @collection = new PhoneCatalog.Collections.Vendors()
    @collection.on("reset", @render, @)
    @collection.fetch()

  render: ->
    $(@el).html(@template())
    @collection.each(@appendVendor, @)
    @

  appendVendor: (vendor) ->
    vendorView = new PhoneCatalog.Views.Vendor(model: vendor, collection: @collection)
    @$("#vendors").append(vendorView.render().el)
