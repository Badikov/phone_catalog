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
      @vendorsView = new PhoneCatalog.Views.VendorsIndex(collection: vendors, display: false)
      @$el.append(@vendorsView.el)
    vendors.fetchIfEmpty =>
      @_showView(@vendorsView)

  showPhones: (vendorName, page) ->
    vendors = PhoneCatalog.Data.Vendors
    vendors.fetchIfEmpty =>
      vendor = vendors.find (vendor) ->
        vendor.get("url") == vendorName
      unless @phonesByVendorView?
        @phonesByVendorView = new PhoneCatalog.Views.PhonesByVendor(vendor: vendor, display: false)
        @$el.append(@phonesByVendorView.render().el)
      @phonesByVendorView.search vendor, page, =>
        @_showView(@phonesByVendorView)

  showPhoneDetails: (phoneId) ->
    unless @detailsView?
      @detailsView = new PhoneCatalog.Views.PhoneDetails(display: false)
      @$el.append(@detailsView.el)
    phone = new PhoneCatalog.Models.Phone(id: phoneId)
    @detailsView.setPhone(phone)
    phones = new PhoneCatalog.Collections.Phones([phone])
    phone.fetch
      success: =>
        @_showView(@detailsView)

  showSearch: (page) ->
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
                @searchView.search(page)

  _createSearchView: (options) ->
    options["display"] = false
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
    @_attachVendorsDOM()
    @_attachPhonesDOM()
    @_attachDetailsDOM()

  _attachVendorsDOM: ->
    vendorsEl = @$("#vendors")
    unless vendorsEl.length is 0
      vendors = PhoneCatalog.Data.Vendors
      vendors.fetchIfEmpty =>
        @vendorsView = new PhoneCatalog.Views.VendorsIndex(el: vendorsEl, collection: vendors)
        @currentView = @vendorsView

  _attachPhonesDOM: ->
    phonesEl = @$("#phones")
    unless phonesEl.length is 0
      vendorName = phonesEl.data("vendor")
      vendors = PhoneCatalog.Data.Vendors
      vendors.fetchIfEmpty =>
        vendor = vendors.find (vendor) ->
          vendor.get("url") == vendorName
        @phonesByVendorView = new PhoneCatalog.Views.PhonesByVendor(el: phonesEl, vendor: vendor)
        @currentView = @phonesByVendorView

  _attachDetailsDOM: ->
    detailsEl = @$("#details")
    unless detailsEl.length is 0
      @detailsView = new PhoneCatalog.Views.PhoneDetails(el: detailsEl)
      @currentView = @detailsView