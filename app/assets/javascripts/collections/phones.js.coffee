class PhoneCatalog.Collections.Phones extends Backbone.Collection

  model: PhoneCatalog.Models.Phone
  url: "phones"

  fetchByVendor: (vendorName, callback) ->
    @fetch
      data: {vendor: vendorName}
      success: ->
        callback() if callback?