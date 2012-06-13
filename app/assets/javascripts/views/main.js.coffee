class PhoneCatalog.Views.Main extends Backbone.View

  className: "container"

  template: JST["main"]

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
    vendors = PhoneCatalog.Data.Vendors
    vendors.fetchIfEmpty =>
      @_createSearchView(vendors: vendors) unless @searchView?
      @_showView(@searchView)

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
    @$el.append(@searchView.render().el)

  _showView: (view) ->
    if @currentView?
      @currentView.hide ->
        view.show()
    else
      view.show()
    @currentView = view