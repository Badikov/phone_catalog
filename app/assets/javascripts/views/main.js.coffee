class PhoneCatalog.Views.Main extends Backbone.View

  className: "container"

  initialize: (options) ->
    @_attachExistentDOM()
    options.router.on("route:home", @showVendors, @)
    options.router.on("route:search", @showSearchFirstPage, @)
    options.router.on("route:searchPage", @showSearch, @)
    options.router.on("route:phonesByVendor", @showPhones, @)
    options.router.on("route:phoneDetails", @showPhoneDetails, @)

  showVendors: ->    
    vendors = PhoneCatalog.Data.Vendors
    unless @vendorsView?
      @vendorsView = new PhoneCatalog.Views.VendorsIndex(collection: vendors, display: false)
      @$el.append(@vendorsView.render().el)

    @_pageTitle(I18n.t("vendors"))
    @_showView(@vendorsView)

  showPhones: (vendorName, page) ->
    vendors = PhoneCatalog.Data.Vendors
    vendor = vendors.find (vendor) ->
      vendor.get("url") == vendorName
    @_pageTitle(vendor.get("name"))
    unless @phonesByVendorView?
      @phonesByVendorView = new PhoneCatalog.Views.PhonesByVendor(vendor: vendor.clone(), display: false)
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
        @_pageTitle(phone.get("name"))
        @_showView(@detailsView)

  showSearchFirstPage: (params) ->
    @showSearch(1, params)

  showSearch: (page, params) ->
    options = {
      vendors: PhoneCatalog.Data.Vendors
      phone_types: PhoneCatalog.Data.PhoneTypes
      case_types:  PhoneCatalog.Data.CaseTypes
      platforms: PhoneCatalog.Data.Platforms
      screen_types: PhoneCatalog.Data.ScreenTypes
      touch_screen_types: PhoneCatalog.Data.TouchScreenTypes
    }
    unless @searchView?
      options["display"] = false
      @searchView = new PhoneCatalog.Views.Search(options)
      @$el.append(@searchView.render().el)
    @_pageTitle(I18n.t("search"))
    @_showView(@searchView)
    @searchView.updateForm(params)
    @searchView.search(page)

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
    @_attachSearchDOM()

  _attachVendorsDOM: ->
    vendorsEl = @$("#vendors")
    unless vendorsEl.length is 0
      vendors = PhoneCatalog.Data.Vendors
      @vendorsView = new PhoneCatalog.Views.VendorsIndex(el: vendorsEl, collection: vendors)
      @currentView = @vendorsView

  _attachPhonesDOM: ->
    phonesEl = @$("#phones")
    unless phonesEl.length is 0
      vendorName = phonesEl.data("vendor")
      vendors = PhoneCatalog.Data.Vendors
      vendor = vendors.find (vendor) ->
        vendor.get("url") == vendorName
      @phonesByVendorView = new PhoneCatalog.Views.PhonesByVendor(el: phonesEl, vendor: vendor.clone())
      @currentView = @phonesByVendorView

  _attachDetailsDOM: ->
    detailsEl = @$("#details")
    unless detailsEl.length is 0
      @detailsView = new PhoneCatalog.Views.PhoneDetails(el: detailsEl)
      @currentView = @detailsView

  _attachSearchDOM: ->
    searchEl = @$("#search")
    unless searchEl.length is 0
      @searchView = new PhoneCatalog.Views.Search(el: searchEl)
      @currentView = @searchView

  _pageTitle: (title) ->
    $("title").text("#{title} - #{I18n.t('phone_catalog')}")