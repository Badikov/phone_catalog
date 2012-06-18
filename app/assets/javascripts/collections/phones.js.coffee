class PhoneCatalog.Collections.Phones extends Backbone.Collection

  model: PhoneCatalog.Models.Phone
  url: ->
    PhoneCatalog.root + "api/phones"

  parse: (response) ->
    @total_pages = response.total_pages
    @page = response.page
    response.phones

  search: (params, callback) ->
    @search_params = params
    @fetch
      data: params
      success: ->
        callback() if callback?

  changePage: (page) ->
    @.trigger("paging", page)
    @search_params["page"] = page
    @search @search_params
