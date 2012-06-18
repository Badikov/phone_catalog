class PhoneCatalog.Views.VendorsIndex extends PhoneCatalog.Views.FadingView

  id: "vendors"

  template: JST["vendors/vendors"]

  initialize: ->
    super
    @collection.on("reset", @render, @)

  render: ->
    @$el.html(@template())
    @collection.each(@appendVendor, @)
    @

  appendVendor: (vendor) ->
    vendorView = new PhoneCatalog.Views.Vendor(model: vendor, collection: @collection)
    @$(".vendors").append(vendorView.render().el)