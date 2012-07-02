class PhoneCatalog.Collections.ScreenTypes extends Backbone.Collection

  model: PhoneCatalog.Models.ScreenType
  url: ->
    PhoneCatalog.root + "api/screen_types"