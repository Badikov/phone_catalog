class PhoneCatalog.Views.Search extends PhoneCatalog.Views.FadingView

  template: JST['search/search']

  initialize: ->
    super
    @phonesView = new PhoneCatalog.Views.PhonesIndex(hidden: false)
    @phonesView.collection.fetch()

  render: ->
    @$el.html(@template())
    @$('#results').html(@phonesView.el)
    @