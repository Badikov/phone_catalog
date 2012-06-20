class PhoneCatalog.Views.PhonesByVendor extends PhoneCatalog.Views.FadingView

  id: "phones"

  template: JST["phones/by_vendor"]

  events:
    "click .breadcrumb a": "navigate"

  initialize: (options) ->
    super
    _.extend(@, PhoneCatalog.Views.Navigable)
    @vendor = options.vendor
    @phonesView = new PhoneCatalog.Views.PhonesIndex()
    @phonesPager = new PhoneCatalog.Views.Pager(collection: @phonesView.collection)
    @breadcrumbsView = new PhoneCatalog.Views.BreadcrumbsByVendor(model: @vendor)

  render: ->
    @$el.html(@template(vendor: @vendor))
    @$('#pager-by-vendor').replaceWith(@phonesPager.el)
    @$('#phones-by-vendor').replaceWith(@phonesView.el)
    @$('#breadcrumbs-by-vendor').replaceWith(@breadcrumbsView.render().el)
    @

  appendPhone: (phone) ->
    phoneView = new PhoneCatalog.Views.Phone(model: phone, collection: @collection)
    @$('.phones').append(phoneView.el)

  search: (vendor, callback) ->
    for attrName, attrValue of vendor.attributes
      @vendor.set(attrName, attrValue, silent: true)
    @vendor.change()
    @phonesView.collection.search({vendor_id: @vendor.get('id'), per_page: 8}, callback)