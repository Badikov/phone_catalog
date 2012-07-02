class PhoneCatalog.Collections.TouchScreenTypes extends Backbone.Collection

  model: PhoneCatalog.Models.TouchScreenType
  url: ->
    PhoneCatalog.root + "api/touch_screen_types"