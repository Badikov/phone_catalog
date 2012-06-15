class PhoneCatalog.Collections.Phones extends Backbone.Collection

  model: PhoneCatalog.Models.Phone
  url: ->
    Backbone.history.options.root + "api/phones"

  parse: (response) ->
    @total_pages = response.total_pages
    @page = response.page
    response.phones

  fetchByVendor: (vendorName, callback) ->
    @fetchByParams({vendor: vendorName}, callback)

  fetchByParams: (params, callback) ->
    @search_params = params
    @fetch
      data: params
      success: ->
        callback() if callback?

  changePage: (page) ->
    @.trigger("paging", page)
    @search_params["page"] = page
    @fetchByParams @search_params
