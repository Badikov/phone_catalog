class PhoneCatalog.Views.PhonesByVendor extends PhoneCatalog.Views.FadingView

  id: "phones"

  template: JST["phones/by_vendor"]

  events:
    "click .breadcrumb a": "navigate"

  initialize: ->
    super
    _.extend(@, PhoneCatalog.Views.Navigable)
    @collection = new PhoneCatalog.Collections.Phones()
    @collection.on("reset", @render, @)

  render: ->
    @$el.html(@template(vendor: @vendor))
    @collection.each(@appendPhone, @)
    @

  appendPhone: (phone) ->
    phoneView = new PhoneCatalog.Views.Phone(model: phone, collection: @collection)
    @$('.phones').append(phoneView.render().el)

  byVendor: (vendorName, callback) ->
    vendors = PhoneCatalog.Data.Vendors
    vendors.fetchIfEmpty =>
      @vendor = vendors.find (vendor) ->
        vendor.get("url") == vendorName
      @collection.search({vendor: vendorName}, callback)