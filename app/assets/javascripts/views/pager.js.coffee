class PhoneCatalog.Views.Pager extends Backbone.View

  className: "pagination"

  template: JST["pager/pager"]

  events:
    "click li:not(.active):not(.disabled) a": "changePage"

  initialize: ->
    @query = ""
    @collection.on('reset', @render, @)

  render: ->
    @$el.html(@template(query: @collection.paramsToQueryString(), total_pages: @collection.total_pages, page: @collection.page, pathPrefix: @options.pathPrefix))
    @

  changePage: (event) ->
    event.preventDefault()
    page = $(event.target).data("page")
    @collection.changePage(page)
    Backbone.history.navigate("#{@options.pathPrefix}page#{page}#{@collection.paramsToQueryString()}")