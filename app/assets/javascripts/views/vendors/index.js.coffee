class PhoneCatalog.Views.VendorsIndex extends PhoneCatalog.Views.FadingView

  className: "row"

  template: JST['vendors/index']

  initialize: ->
    super
    @collection = new PhoneCatalog.Collections.Vendors()
    @collection.on("reset", @render, @)
    @collection.on("select", @selectVendor, @)

  render: ->
    @$el.html(@template())
    @collection.each(@appendVendor, @)
    @

  appendVendor: (vendor) ->
    vendorView = new PhoneCatalog.Views.Vendor(model: vendor, collection: @collection)
    @$("#vendors").append(vendorView.render().el)

  selectVendor: (vendor) ->
    Backbone.history.navigate(vendor.path(), {trigger: true})