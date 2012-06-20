class PhoneCatalog.Views.PhonesByVendor extends PhoneCatalog.Views.FadingView

  id: "phones"

  template: JST["phones/by_vendor"]

  events:
    "click .breadcrumb a": "navigate"

  initialize: (options) ->
    super
    _.extend(@, PhoneCatalog.Views.Navigable)
    @vendor = options.vendor
    @_createSubviews()

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

  _createSubviews: ->
    @_createOrAttachPhonesView()
    @_createOrAttachPager()
    @_createOrAttachBreadcrumbs()

  _createOrAttachPhonesView: ->
    phonesViewEl = @$('ul.phones')
    if phonesViewEl.length is 0
      @phonesView = new PhoneCatalog.Views.PhonesIndex(collection: new PhoneCatalog.Collections.Phones())
    else
      phones = PhoneCatalog.Preloaded.Phones # TODO: is it wrong place?
      @phonesView = new PhoneCatalog.Views.PhonesIndex(el: phonesViewEl, collection: phones)

  _createOrAttachPager: ->
    pagerEl = @$('.pagination')
    if pagerEl.length is 0
      @phonesPager = new PhoneCatalog.Views.Pager(collection: @phonesView.collection)
    else
      @phonesPager = new PhoneCatalog.Views.Pager(el: pagerEl, collection: @phonesView.collection)

  _createOrAttachBreadcrumbs: ->
    breadcrumbsEl = @$('.breadcrumb')
    if breadcrumbsEl.length is 0
      @breadcrumbsView = new PhoneCatalog.Views.BreadcrumbsByVendor(model: @vendor)
    else
      @breadcrumbsView = new PhoneCatalog.Views.BreadcrumbsByVendor(el: breadcrumbsEl, model: @vendor)
