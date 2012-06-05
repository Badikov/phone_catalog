class PhoneCatalog.Views.VendorsIndex extends Backbone.View

  id: "vendors-index"
  className: "row tab-pane fade"

  template: JST['vendors/index']

  initialize: ->
    @collection = new PhoneCatalog.Collections.Vendors()
    @collection.on("reset", @render, @)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendVendor, @)
    @

  appendVendor: (vendor) ->
    vendorView = new PhoneCatalog.Views.Vendor(model: vendor, collection: @collection)
    @$("#vendors").append(vendorView.render().el)

  show: ->
    $("a[href='##{@id}']").tab('show')