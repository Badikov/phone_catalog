class PhoneCatalog.Collections.PhoneTypes extends Backbone.Collection

  model: PhoneCatalog.Models.PhoneType
  url: ->
    PhoneCatalog.root + "api/phone_types"