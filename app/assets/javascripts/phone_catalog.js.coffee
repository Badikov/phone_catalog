window.PhoneCatalog =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new PhoneCatalog.Routers.Main()
    Backbone.history.start(pushState: true, root: $("body").data("root"))

$(document).ready ->
  PhoneCatalog.init()
