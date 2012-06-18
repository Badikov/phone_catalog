class PhoneCatalog.Views.Navigable

  @navigate: (event) ->
    event.preventDefault()
    Backbone.history.navigate($(event.target).attr("href"), {trigger: true})