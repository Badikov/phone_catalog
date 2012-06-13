class PhoneCatalog.Collections.Vendors extends Backbone.Collection

  model: PhoneCatalog.Models.Vendor
  url: ->
    Backbone.history.options.root + "api/vendors"

  fetchIfEmpty: (callback) ->
    if @length is 0
      @fetch
        success: ->
          callback() if callback?
    else
      callback() if callback?