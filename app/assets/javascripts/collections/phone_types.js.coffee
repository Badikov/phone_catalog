class PhoneCatalog.Collections.PhoneTypes extends PhoneCatalog.Collections.LazyCollection

  model: PhoneCatalog.Models.PhoneType
  url: ->
    PhoneCatalog.root + "api/phone_types"