class PhoneCatalog.Collections.PhoneTypes extends PhoneCatalog.Collections.LazyCollection

  model: PhoneCatalog.Models.PhoneType
  url: ->
    Backbone.history.options.root + "api/phone_types"