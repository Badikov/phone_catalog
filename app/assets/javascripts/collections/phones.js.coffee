class PhoneCatalog.Collections.Phones extends Backbone.Collection

  model: PhoneCatalog.Models.Phone
  url: "/phones"

  fetchByVendor: (vendorName) ->
    @fetch(data: {vendor: vendorName})