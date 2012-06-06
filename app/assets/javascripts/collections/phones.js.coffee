class PhoneCatalog.Collections.Phones extends Backbone.Collection

  model: PhoneCatalog.Models.Phone
  url: ->
    Backbone.history.options.root + "api/phones"

  fetchByVendor: (vendorName, callback) ->
    @fetch
      data: {vendor: vendorName}
      success: ->
        callback() if callback?