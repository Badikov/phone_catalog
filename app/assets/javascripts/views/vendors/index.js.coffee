class PhoneCatalog.Views.VendorsIndex extends Backbone.View

  id: "vendors-index"
  className: "row tab-pane fade"

  template: JST['vendors/index']

  initialize: ->
    _.extend this, PhoneCatalog.Utils.BootstrapTab
    @collection = new PhoneCatalog.Collections.Vendors()
    @collection.on("reset", @render, @)
    @collection.on("select", @selectVendor, @)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendVendor, @)
    @

  appendVendor: (vendor) ->
    vendorView = new PhoneCatalog.Views.Vendor(model: vendor, collection: @collection)
    @$("#vendors").append(vendorView.render().el)

  selectVendor: (vendor) ->
    Backbone.history.navigate("#{vendor.get('url')}", {trigger: true})