class PhoneCatalog.Views.Main extends Backbone.View

  className: "container"

  template: JST["main"]

  initialize: (options) ->
    options.router.on("route:home", @showVendors, @)
    options.router.on("route:search", @showSearch, @)
    options.router.on("route:phonesByVendor", @showPhones, @)
    options.router.on("route:phoneDetails", @showPhoneDetails, @)

  render: ->
    @$el.html(@template())
    @

  showVendors: ->
    vendors = PhoneCatalog.Data.Vendors
    @_createVendorsView(vendors) unless @vendorsView?
    vendors.fetchIfEmpty =>
      @_showView(@vendorsView)

  showPhones: (vendorName) ->
    @_createPhonesView() unless @phonesView?
    @phonesView.collection.fetchByVendor vendorName, =>
      @_showView(@phonesView)

  showPhoneDetails: (phoneId) ->
    @_createDetailsView() unless @detailsView?
    phone = new PhoneCatalog.Models.Phone(id: phoneId)
    @detailsView.setPhone(phone)
    phones = new PhoneCatalog.Collections.Phones([phone])
    phone.fetch
      success: =>
        @_showView(@detailsView)

  showSearch: ->
    options = {
      vendors: PhoneCatalog.Data.Vendors
      phone_types: PhoneCatalog.Data.PhoneTypes
      case_types:  PhoneCatalog.Data.CaseTypes
      platforms: PhoneCatalog.Data.Platforms
      screen_types: PhoneCatalog.Data.ScreenTypes
      touch_screen_types: PhoneCatalog.Data.TouchScreenTypes
    }
    options.vendors.fetchIfEmpty =>
      options.phone_types.fetchIfEmpty =>
        options.case_types.fetchIfEmpty =>
          options.platforms.fetchIfEmpty =>
            options.screen_types.fetchIfEmpty =>
              options.touch_screen_types.fetchIfEmpty =>
                @_createSearchView options unless @searchView?
                @_showView(@searchView)
                @searchView.search()

  _createVendorsView: (vendors) ->
    @vendorsView = new PhoneCatalog.Views.VendorsIndex(collection: vendors)
    @$('#vendors').append(@vendorsView.el)

  _createPhonesView: ->
    @phonesView = new PhoneCatalog.Views.PhonesIndex()
    @$('#phones').append(@phonesView.el)

  _createDetailsView: ->
    @detailsView = new PhoneCatalog.Views.PhoneDetails()
    @$('#details').append(@detailsView.el)

  _createSearchView: (options) ->
    @searchView = new PhoneCatalog.Views.Search(options)
    @$("#search").append(@searchView.render().el)

  _showView: (view) ->
    if @currentView?
      @currentView.hide ->
        view.show()
    else
      view.show()
    @currentView = view