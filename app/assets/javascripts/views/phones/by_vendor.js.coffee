class PhoneCatalog.Views.PhonesByVendor extends PhoneCatalog.Views.FadingView

  id: "phones"

  template: JST["phones/by_vendor"]

  events:
    "click .breadcrumb a": "navigate"

  initialize: (options) ->
    super
    _.extend(@, PhoneCatalog.Views.Navigable)
    @vendor = options.vendor
    @phonesView = new PhoneCatalog.Views.PhonesIndex(display: false)
    @phonesPager = new PhoneCatalog.Views.Pager(collection: @phonesView.collection)

  render: ->
    @$el.html(@template(vendor: @vendor))
    @$('#pager-by-vendor').append(@phonesPager.el)
    @$('#phones-by-vendor').append(@phonesView.el)
    @

  appendPhone: (phone) ->
    phoneView = new PhoneCatalog.Views.Phone(model: phone, collection: @collection)
    @$('.phones').append(phoneView.render().el)

  search: (callback) ->
    @phonesView.collection.search({vendor_id: @vendor.get('id'), per_page: 8}, callback)