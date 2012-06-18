class PhoneCatalog.Views.VendorsIndex extends PhoneCatalog.Views.FadingView

  tagName: "ul"
  className: "vendors thumbnails"

  initialize: ->
    super
    @collection.on("reset", @render, @)

  render: ->
    @$el.empty()
    @collection.each(@appendVendor, @)
    @

  appendVendor: (vendor) ->
    vendorView = new PhoneCatalog.Views.Vendor(model: vendor, collection: @collection)
    @$el.append(vendorView.render().el)