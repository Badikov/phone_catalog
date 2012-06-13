class PhoneCatalog.Views.Main extends Backbone.View

  className: "container"

  template: JST["main"]

  render: ->
    @$el.html(@template())
    @

  showVendors: ->
    @_createVendorsView() unless @vendorsView?
    @vendorsView.collection.fetch
      success: =>
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
    @_createSearchView() unless @searchView?
    @_showView(@searchView)

  _createVendorsView: ->
    @vendorsView = new PhoneCatalog.Views.VendorsIndex()
    @$('#vendors').append(@vendorsView.el)

  _createPhonesView: ->
    @phonesView = new PhoneCatalog.Views.PhonesIndex()
    @$('#phones').append(@phonesView.el)

  _createDetailsView: ->
    @detailsView = new PhoneCatalog.Views.PhoneDetails()
    @$('#details').append(@detailsView.el)

  _createSearchView: ->
    @searchView = new PhoneCatalog.Views.Search()
    @$el.append(@searchView.render().el)

  _showView: (view) ->
    if @currentView?
      @currentView.hide ->
        view.show()
    else
      view.show()
    @currentView = view