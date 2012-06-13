window.PhoneCatalog =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Data: {} # for reusable constant data like 'vendors'
  init: ->
    PhoneCatalog.Data.Vendors = new PhoneCatalog.Collections.Vendors()
    new PhoneCatalog.Routers.Main()
    root = $("body").data("root")
    Backbone.history.start(pushState: true, root: root)

$(document).ready ->
  PhoneCatalog.init()
