class PhoneCatalog.Routers.Main extends Backbone.Router

  routes:
    '': "index"
    'search': "search"
    ':vendor': "phonesByVendor"
    'phones/:phoneId': "phoneDetails"

  initialize: ->
    @.on("all", -> console.log arguments)
    @mainView = new PhoneCatalog.Views.Main()
    $('body').append(@mainView.render().el)

  index: ->
    @mainView.showVendors()

  phonesByVendor: (vendorName) ->
    @mainView.showPhones(vendorName)

  phoneDetails: (phoneId) ->
    @mainView.showPhoneDetails(phoneId)

  search: ->
    @mainView.showSearch()