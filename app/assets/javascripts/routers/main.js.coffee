class PhoneCatalog.Routers.Main extends Backbone.Router

  routes:
    '': "home"
    'search': "search"
    'search/page:page': "searchPage"
    ':vendor': "phonesByVendor"
    ':vendor/page:page': "phonesByVendor"
    'phones/:phoneId': "phoneDetails"

  initialize: ->
    @.on("all", -> console.log arguments)
