
window.PhoneCatalog =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Data: {} # for reusable constant data like 'vendors'
  init: ->
    PhoneCatalog.Data.Vendors = new PhoneCatalog.Collections.Vendors()
    PhoneCatalog.Data.PhoneTypes = new PhoneCatalog.Collections.PhoneTypes()
    PhoneCatalog.Data.CaseTypes = new PhoneCatalog.Collections.CaseTypes()
    PhoneCatalog.Data.Platforms = new PhoneCatalog.Collections.Platforms()
    PhoneCatalog.Data.ScreenTypes = new PhoneCatalog.Collections.ScreenTypes()
    PhoneCatalog.Data.TouchScreenTypes = new PhoneCatalog.Collections.TouchScreenTypes()
    new PhoneCatalog.Routers.Main()
    root = $("body").data("root")
    Backbone.history.start(pushState: true, root: root)

$(document).ready ->
  PhoneCatalog.init()
