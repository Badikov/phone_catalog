class PhoneCatalog.Views.Main extends Backbone.View

  id: 'main-tabs'
  template: JST["main"]

  initialize: ->
    @render()
    $("#container").append($(@el))

  render: ->
    $(@el).html(@template())
    @

  showVendors: ->
    @createVendorsView() unless @vendorsView?
    @vendorsView.collection.fetch
      success: =>
        @vendorsView.show()

  showPhones: (vendorName) ->
    @createPhonesView() unless @phonesView?
    @phonesView.collection.fetchByVendor vendorName, =>
      @phonesView.show()

  showPhoneDetails: (phoneId) ->
    @createDetailsView() unless @detailsView
    phone = new PhoneCatalog.Models.Phone(id: phoneId)
    @detailsView.setPhone(phone)
    phones = new PhoneCatalog.Collections.Phones([phone])
    phone.fetch
      success: =>
        console.log phone
        @detailsView.show()

  createVendorsView: ->
    @vendorsView = new PhoneCatalog.Views.VendorsIndex()
    @$('.tab-content').append(@vendorsView.el)

  createPhonesView: ->
    @phonesView = new PhoneCatalog.Views.PhonesIndex()
    @$('.tab-content').append(@phonesView.el)

  createDetailsView: ->
    @detailsView = new PhoneCatalog.Views.PhoneDetails()
    @$('.tab-content').append(@detailsView.el)