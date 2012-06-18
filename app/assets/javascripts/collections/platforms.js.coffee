class PhoneCatalog.Collections.Platforms extends PhoneCatalog.Collections.LazyCollection

  model: PhoneCatalog.Models.Platform
  url: ->
    PhoneCatalog.root + "api/platforms"