class PhoneCatalog.Collections.Vendors extends Backbone.Collection

  model: PhoneCatalog.Models.Vendor
  url: ->
    PhoneCatalog.root + "api/vendors"