class PhoneCatalog.Collections.Phones extends Backbone.Collection

  model: PhoneCatalog.Models.Phone
  url: ->
    Backbone.history.options.root + "api/phones"

  fetchByVendor: (vendorName, callback) ->
    @fetchByParams({vendor: vendorName}, callback)

  fetchByParams: (params, callback) ->
    @fetch
      data: params
      success: ->
        callback() if callback?