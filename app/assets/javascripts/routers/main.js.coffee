class PhoneCatalog.Routers.Main extends Backbone.Router

  routes:
    '': "home"
    'search': "search"
    ':vendor': "phonesByVendor"
    'phones/:phoneId': "phoneDetails"

  initialize: ->
    @.on("all", -> console.log arguments)
