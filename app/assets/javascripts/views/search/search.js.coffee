class PhoneCatalog.Views.Search extends PhoneCatalog.Views.FadingView

  template: JST['search/search']

  events:
    "submit form": "search"

  initialize: (options) ->
    super
    @phonesView = new PhoneCatalog.Views.PhonesIndex(hidden: false)
    @phonesView.collection.fetch()
    @vendors = options.vendors

  render: ->
    @$el.html(@template(vendors: PhoneCatalog.Data.Vendors))
    @$('#results').html(@phonesView.el)
    @

  search: (event) ->
    event.preventDefault()
    @phonesView.collection.fetchByParams
      vendor: @$('select[name="vendor"]').val()