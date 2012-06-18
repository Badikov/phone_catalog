class PhoneCatalog.Collections.ScreenTypes extends PhoneCatalog.Collections.LazyCollection

  model: PhoneCatalog.Models.ScreenType
  url: ->
    PhoneCatalog.root + "api/screen_types"