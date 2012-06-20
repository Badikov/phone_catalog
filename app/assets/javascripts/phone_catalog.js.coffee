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

    PhoneCatalog.root = $("body").data("root")

    router = new PhoneCatalog.Routers.Main()
    navigation = new PhoneCatalog.Views.Navigation(el: $(".navbar")[0], router: router)
    mainView = new PhoneCatalog.Views.Main(el: $("#main.container"), router: router)

    Backbone.history.start(pushState: true, root: PhoneCatalog.root, silent: true)

$(document).ready ->
  PhoneCatalog.init()
