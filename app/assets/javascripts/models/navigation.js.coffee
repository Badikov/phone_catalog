class PhoneCatalog.Models.Navigation extends Backbone.Model

  initialize: ->
    @routes =
      home:
        path: PhoneCatalog.root
        label: "vendors"
      search:
        path: PhoneCatalog.root + "search"
        label: "search"

  go: (route) ->
    @.set("currentPath", @routes[route].path) if @routes[route]?
