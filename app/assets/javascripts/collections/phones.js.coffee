class PhoneCatalog.Collections.Phones extends Backbone.Collection

  model: PhoneCatalog.Models.Phone
  url: ->
    PhoneCatalog.root + "api/phones"

  initialize: (options) ->
    @searchParams = {}
    if options?
      @searchParams = if options.searchParams? then options.searchParams else {}
      @searchParams["per_page"] = options.per_page if options.per_page?
      @searchParams["vendor_id"] = options.vendor_id if options.vendor_id?

  parse: (response) ->
    @total_pages = response.total_pages
    @page = response.page
    response.phones

  search: (params, callback) ->
    @searchParams = params
    @fetch
      data: params
      success: ->
        callback() if callback?

  changePage: (page) ->
    @.trigger("paging", page)
    @searchParams["page"] = page
    @search @searchParams

  paramsToQueryString: ->
    query = ""
    if @searchParams?
      params = []
      for k, v of @searchParams
        if k != "page" && k != "per_page" && v? && v.length > 0
          params.push encodeURI("#{k}=#{v}")
      query = "?" + params.join("&") if params.length > 0
    query
