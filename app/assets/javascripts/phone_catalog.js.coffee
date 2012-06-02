window.PhoneCatalog =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new PhoneCatalog.Routers.Vendors()
    Backbone.history.start(pushState: true)

$(document).ready ->
  PhoneCatalog.init()
