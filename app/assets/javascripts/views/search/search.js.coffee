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
    searchParams = {page: page}
    for p in ("#{r}_id" for r in PhoneCatalog.Models.Phone.referenceProperties())
      searchParams[p] = @$("select[name='#{p}']").val()
    for p in PhoneCatalog.Models.Phone.booleanProperties()
      searchParams[p] = @$("input:radio[name='#{p}']:checked").val()
    searchParams["per_page"] = 6
    @phonesView.collection.search searchParams

  updateForm: (params) ->
    for p in ("#{r}_id" for r in PhoneCatalog.Models.Phone.referenceProperties())
      value = if params?[p]? then params[p] else ""
      @$("select[name='#{p}']").val(value)
    for p in PhoneCatalog.Models.Phone.booleanProperties()
      value = if params?[p]? then params[p] else ""
      @$("input:radio[name='#{p}'][value='#{value}']").attr('checked', 'checked')

  _doSearch: (event) ->
    event.preventDefault()
    @search()
    query = @phonesView.collection.paramsToQueryString()
    Backbone.history.navigate("search#{query}")

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