class PhoneCatalog.Collections.Vendors extends PhoneCatalog.Collections.LazyCollection

  model: PhoneCatalog.Models.Vendor
  url: ->
    Backbone.history.options.root + "api/vendors"