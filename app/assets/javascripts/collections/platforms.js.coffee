class PhoneCatalog.Collections.Platforms extends Backbone.Collection

  model: PhoneCatalog.Models.Platform
  url: ->
    PhoneCatalog.root + "api/platforms"