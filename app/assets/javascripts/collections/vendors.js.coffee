class PhoneCatalog.Collections.Vendors extends Backbone.Collection

  model: PhoneCatalog.Models.Vendor
  url: ->
    Backbone.history.options.root + "api/vendors"
