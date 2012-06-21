class PhoneCatalog.Views.Navigable

  @navigate: (event) ->
    event.preventDefault()
    url = $(event.target).attr("href")
    url = url[PhoneCatalog.root.length..url.length] if url.indexOf(PhoneCatalog.root) == 0
    Backbone.history.navigate(url, {trigger: true})