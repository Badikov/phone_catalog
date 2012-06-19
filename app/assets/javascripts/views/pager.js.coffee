class PhoneCatalog.Views.Pager extends Backbone.View

  className: "pagination"

  template: JST["pager/pager"]

  events:
    "click li:not(.active):not(.disabled) a": "changePage"

  initialize: ->
    @collection.on('reset', @render, @)

  render: ->
    @$el.html(@template(total_pages: @collection.total_pages, page: @collection.page))
    @

  changePage: (event) ->
    event.preventDefault()
    page = $(event.target).data("page")
    @collection.changePage(page)