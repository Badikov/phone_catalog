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

  selectVendor: (vendor) ->
    Backbone.history.navigate("#{vendor.get('url')}", {trigger: true})

  createVendorsView: ->
    @vendorsView = new PhoneCatalog.Views.VendorsIndex()
    @$('.tab-content').append(@vendorsView.el)
    @vendorsView.collection.on("select", @selectVendor, @)

  createPhonesView: ->
    @phonesView = new PhoneCatalog.Views.PhonesIndex()
    @$('.tab-content').append(@phonesView.el)