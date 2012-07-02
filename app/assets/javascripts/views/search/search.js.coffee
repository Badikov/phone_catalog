class PhoneCatalog.Views.Search extends PhoneCatalog.Views.FadingView

  id: "search"

  template: JST['search/search']

  events:
    "submit form": "_doSearch"
    "change form select": "_doSearch"
    "change form input:radio": "_doSearch"

  initialize: () ->
    super
    @_createSubviews()

  render: ->
    @$el.html(@template(options: @options))
    @$('#pager-search').replaceWith(@phonesPager.el)
    @$('#results').replaceWith(@phonesView.el)
    @

  search: (page) ->
    params = {page: page}
    for p in ("#{r}_id" for r in PhoneCatalog.Models.Phone.referenceProperties())
      params[p] = @$("select[name='#{p}']").val()
    for p in PhoneCatalog.Models.Phone.booleanProperties()
      params[p] = @$("input:radio[name='#{p}']:checked").val()
    params["per_page"] = 6
    @phonesView.collection.search params

  _doSearch: (event) ->
    event.preventDefault()
    @search()

  _createSubviews: ->
    @_createOrAttachPhonesView()
    @_createOrAttachPager()

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
      @phonesPager = new PhoneCatalog.Views.Pager(collection: @phonesView.collection, pathPrefix: "search/")
    else
      @phonesPager = new PhoneCatalog.Views.Pager(el: pagerEl, collection: @phonesView.collection, pathPrefix: "search/")