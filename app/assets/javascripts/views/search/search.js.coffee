class PhoneCatalog.Views.Search extends PhoneCatalog.Views.FadingView

  id: "search"

  template: JST['search/search']

  events:
    "submit form": "search"
    "change form select": "search"
    "change form input:radio": "search"

  initialize: () ->
    super
    phones = new PhoneCatalog.Collections.Phones()
    @phonesView = new PhoneCatalog.Views.PhonesIndex(collection: phones, display: true)
    @phonesPager = new PhoneCatalog.Views.Pager(collection: phones)

  render: ->
    @$el.html(@template(options: @options))
    @$('#pager-search').append(@phonesPager.el)
    @$('#results').append(@phonesView.el)
    @

  search: (event) ->
    event?.preventDefault()
    params = {}
    for p in ("#{r}_id" for r in PhoneCatalog.Models.Phone.referenceProperties())
      params[p] = @$("select[name='#{p}']").val()
    for p in PhoneCatalog.Models.Phone.booleanProperties()
      params[p] = @$("input:radio[name='#{p}']:checked").val()
    params["per_page"] = 6
    @phonesView.collection.search params