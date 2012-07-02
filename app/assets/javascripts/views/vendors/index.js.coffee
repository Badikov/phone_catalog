class PhoneCatalog.Views.VendorsIndex extends PhoneCatalog.Views.FadingView

  id: "vendors"

  template: JST["vendors/vendors"]

  initialize: ->
    super
    @_attachExistentDOM()

  render: ->
    unless @visible # vendor list is immutable
      @$el.html(@template())
      @collection.each(@appendVendor, @)
    @

  appendVendor: (vendor) ->
    vendorView = new PhoneCatalog.Views.Vendor(model: vendor)
    @$(".vendors").append(vendorView.render().el)

  _attachExistentDOM: ->
    vendorsListEl= @$("ul.vendors")
    vendors = @collection
    unless vendorsListEl.length is 0
      vendorsListEl.find('li').each (vendorElIndex, vendorEl) ->
        vendor_id = $(vendorEl).data("id")
        vendor = vendors.get(vendor_id)
        vendorView = new PhoneCatalog.Views.Vendor(el: vendorEl, model: vendor)