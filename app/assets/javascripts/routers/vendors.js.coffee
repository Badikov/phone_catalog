class PhoneCatalog.Routers.Vendors extends Backbone.Router

  routes:
    '': "index"

  initialize: ->
    @collection = new PhoneCatalog.Collections.Vendors()
    @collection.fetch()

  index: ->
    view = new PhoneCatalog.Views.VendorsIndex(collection: @collection)
    $("#container").html(view.render().el)