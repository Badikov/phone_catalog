class PhoneCatalog.Routers.Main extends Backbone.Router

  routes:
    '': "index"
    ':vendor': "phonesByVendor"
    'phones/:phoneId': "phoneDetails"

  initialize: ->
    @.on("all", -> console.log arguments)
    @mainView = new PhoneCatalog.Views.Main()

  index: ->
    @mainView.showVendors()

  phonesByVendor: (vendorName) ->
    @mainView.showPhones(vendorName)

  phoneDetails: (phoneId) ->
    @mainView.showPhoneDetails(phoneId)