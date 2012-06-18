class PhoneCatalog.Views.Navigation extends Backbone.View

  className: "navbar navbar-fixed-top"

  template: JST["navigation"]

  events:
    "click a": "navigate"

  initialize: (options) ->
    _.extend(@, PhoneCatalog.Views.Navigable)
    @model = new PhoneCatalog.Models.Navigation()
    @model.on("change", @render, @)
    for route of @model.routes
      @_makeRoute(options.router, route)

  render: ->
    @$el.html(@template(routes: @model.routes, currentPath: @model.get("currentPath")))
    @

  _makeRoute: (router, route) ->
    callback = =>
      @model.go(route)
    router.on("route:#{route}", callback)