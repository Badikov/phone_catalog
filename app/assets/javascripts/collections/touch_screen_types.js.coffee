class PhoneCatalog.Collections.TouchScreenTypes extends PhoneCatalog.Collections.LazyCollection

  model: PhoneCatalog.Models.TouchScreenType
  url: ->
    PhoneCatalog.root + "api/touch_screen_types"