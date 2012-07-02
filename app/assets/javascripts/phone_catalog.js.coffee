window.PhoneCatalog =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Data: {} # for reusable constant data like 'vendors'
  Preloaded: {} # for preloaded temporary data
  init: ->
    PhoneCatalog.root = $("body").data("root")

    router = new PhoneCatalog.Routers.Main()
    navigation = new PhoneCatalog.Views.Navigation(el: $(".navbar")[0], router: router)
    mainView = new PhoneCatalog.Views.Main(el: $("#main.container"), router: router)

    Backbone.history.start(pushState: true, root: PhoneCatalog.root, silent: true)

$(document).ready ->
  PhoneCatalog.init()
