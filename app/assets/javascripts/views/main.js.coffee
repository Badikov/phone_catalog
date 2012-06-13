class PhoneCatalog.Views.Main extends Backbone.View

  initialize: ->
    $("#container").append(@$el)

  showVendors: ->
    @createVendorsView() unless @vendorsView?
    @vendorsView.collection.fetch
      success: =>
        @showView(@vendorsView)

  showPhones: (vendorName) ->
    @createPhonesView() unless @phonesView?
    @phonesView.collection.fetchByVendor vendorName, =>
      @showView(@phonesView)

  showPhoneDetails: (phoneId) ->
    @createDetailsView() unless @detailsView?
    phone = new PhoneCatalog.Models.Phone(id: phoneId)
    @detailsView.setPhone(phone)
    phones = new PhoneCatalog.Collections.Phones([phone])
    phone.fetch
      success: =>
        @showView(@detailsView)

  createVendorsView: ->
    @vendorsView = new PhoneCatalog.Views.VendorsIndex()
    @$el.append(@vendorsView.el)

  createPhonesView: ->
    @phonesView = new PhoneCatalog.Views.PhonesIndex()
    @$el.append(@phonesView.el)

  createDetailsView: ->
    @detailsView = new PhoneCatalog.Views.PhoneDetails()
    @$el.append(@detailsView.el)

  showView: (view) ->
    if @currentView?
      @currentView.hide ->
        view.show()
    else
      view.show()
    @currentView = view