class PhoneCatalog.Collections.Vendors extends PhoneCatalog.Collections.LazyCollection

  model: PhoneCatalog.Models.Vendor
  url: ->
    PhoneCatalog.root + "api/vendors"