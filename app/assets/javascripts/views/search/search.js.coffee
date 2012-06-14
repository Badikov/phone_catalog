class PhoneCatalog.Views.Search extends PhoneCatalog.Views.FadingView

  template: JST['search/search']

  events:
    "change form select": "search"
    "change form input:radio": "search"

  initialize: () ->
    super
    @phonesView = new PhoneCatalog.Views.PhonesIndex(hidden: false)
    @phonesView.collection.fetch()

  render: ->
    @$el.html(@template(options: @options))
    @$('#results').html(@phonesView.el)
    @

  search: (event) ->
    event.preventDefault()
    params = {}
    for p in ("#{r}_id" for r in PhoneCatalog.Models.Phone.referenceProperties())
      params[p] = @$("select[name='#{p}']").val()
    for p in PhoneCatalog.Models.Phone.booleanProperties()
      params[p] = @$("input:radio[name='#{p}']:checked").val()
    @phonesView.collection.fetchByParams params