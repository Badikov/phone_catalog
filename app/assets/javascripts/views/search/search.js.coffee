class PhoneCatalog.Views.Search extends PhoneCatalog.Views.FadingView

  id: "search"

  template: JST['search/search']

  events:
    "submit form": "_doSearch"
    "change form select": "_doSearch"
    "change form input:radio": "_doSearch"

  initialize: () ->
    super
    phones = new PhoneCatalog.Collections.Phones()
    @phonesView = new PhoneCatalog.Views.PhonesIndex(collection: phones, display: true)
    @phonesPager = new PhoneCatalog.Views.Pager(collection: phones, pathPrefix: "search/")

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