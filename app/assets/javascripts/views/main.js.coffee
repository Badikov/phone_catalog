class PhoneCatalog.Views.Main extends Backbone.View

  className: "container"

  initialize: (options) ->
    @_attachExistentDOM()
    options.router.on("route:home", @showVendors, @)
    options.router.on("route:search", @showSearch, @)
    options.router.on("route:phonesByVendor", @showPhones, @)
    options.router.on("route:phoneDetails", @showPhoneDetails, @)

  showVendors: ->
    vendors = PhoneCatalog.Data.Vendors
    unless @vendorsView?
      @vendorsView = new PhoneCatalog.Views.VendorsIndex(collection: vendors)
      @$el.append(@vendorsView.el)
    vendors.fetchIfEmpty =>
      @_showView(@vendorsView)

  showPhones: (vendorName) ->
    vendors = PhoneCatalog.Data.Vendors
    vendors.fetchIfEmpty =>
      vendor = vendors.find (vendor) ->
        vendor.get("url") == vendorName
      @_createPhonesByVendorView(vendor) unless @phonesByVendorView?
      @phonesByVendorView.search vendor, =>
        @_showView(@phonesByVendorView)

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

  _createPhonesByVendorView: (vendor) ->
    @phonesByVendorView = new PhoneCatalog.Views.PhonesByVendor(vendor: vendor, display: false)
    @$el.append(@phonesByVendorView.render().el)

  _createDetailsView: ->
    @detailsView = new PhoneCatalog.Views.PhoneDetails()
    @$el.append(@detailsView.el)

  _createSearchView: (options) ->
    @searchView = new PhoneCatalog.Views.Search(options)
    @$el.append(@searchView.render().el)

  _showView: (view) ->
    if @currentView?
      @currentView.hide ->
        view.show()
    else
      view.show()
    @currentView = view

  _attachExistentDOM: ->
    vendorsEl = @$("#vendors")
    unless vendorsEl.length is 0
      vendors = PhoneCatalog.Data.Vendors
      vendors.fetchIfEmpty =>
        @vendorsView = new PhoneCatalog.Views.VendorsIndex(el: vendorsEl, collection: vendors, display: true)
        @currentView = @vendorsView