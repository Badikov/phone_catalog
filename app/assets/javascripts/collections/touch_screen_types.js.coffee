class PhoneCatalog.Collections.TouchScreenTypes extends PhoneCatalog.Collections.LazyCollection

  model: PhoneCatalog.Models.TouchScreenType
  url: ->
    Backbone.history.options.root + "api/touch_screen_types"