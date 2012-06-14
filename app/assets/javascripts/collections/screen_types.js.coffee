class PhoneCatalog.Collections.ScreenTypes extends PhoneCatalog.Collections.LazyCollection

  model: PhoneCatalog.Models.ScreenType
  url: ->
    Backbone.history.options.root + "api/screen_types"