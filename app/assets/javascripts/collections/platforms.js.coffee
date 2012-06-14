class PhoneCatalog.Collections.Platforms extends PhoneCatalog.Collections.LazyCollection

  model: PhoneCatalog.Models.Platform
  url: ->
    Backbone.history.options.root + "api/platforms"