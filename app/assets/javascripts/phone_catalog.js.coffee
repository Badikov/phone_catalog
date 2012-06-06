window.PhoneCatalog =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Utils: {}
  init: ->
    new PhoneCatalog.Routers.Main()
    root = $("body").data("root")
    Backbone.history.start(pushState: true, root: root)

$(document).ready ->
  PhoneCatalog.init()
