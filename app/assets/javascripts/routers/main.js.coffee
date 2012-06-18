class PhoneCatalog.Routers.Main extends Backbone.Router

  routes:
    '': "home"
    'search': "search"
    ':vendor': "phonesByVendor"
    'phones/:phoneId': "phoneDetails"

  initialize: ->
    @.on("all", -> console.log arguments)
    @navigation = new PhoneCatalog.Views.Navigation(router: @)
    $('body').append(@navigation.el)
    @mainView = new PhoneCatalog.Views.Main()
    $('body').append(@mainView.render().el)

  home: ->
    @mainView.showVendors()

  phonesByVendor: (vendorName) ->
    @mainView.showPhones(vendorName)

  phoneDetails: (phoneId) ->
    @mainView.showPhoneDetails(phoneId)

  search: ->
    @mainView.showSearch()