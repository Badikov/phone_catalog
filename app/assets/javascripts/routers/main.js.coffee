class PhoneCatalog.Routers.Main extends Backbone.Router

  routes:
    '': "index"
    ':vendor': "phonesByVendor"

  initialize: ->
    @.on("all", -> console.log arguments)

  index: ->
    if @phonesView?
      @hidePhones(=> @showVendors())
    else
      @showVendors()

  phonesByVendor: (vendorName) ->
    if @vendorsView?
      @hideVendors(=> @showPhones(vendorName))
    else
      @showPhones(vendorName)

  showVendors: ->
    unless @vendorsView?
      @vendorsView = new PhoneCatalog.Views.VendorsIndex()
      @vendorsView.collection.on("select", @selectVendor, @)

    @vendorsView.collection.fetch
      success: =>
        $(@vendorsView.el).fadeIn("slow")
        $("#container").html(@vendorsView.el)

  hideVendors: (callback) ->
    $(@vendorsView.el).fadeOut "slow", ->
      callback() if callback?

  showPhones: (vendorName) ->
    @phonesView = new PhoneCatalog.Views.PhonesIndex() unless @phonesView?
    @phonesView.collection.fetchByVendor vendorName, =>
      $(@phonesView.el).fadeIn("slow")
      $("#container").html(@phonesView.el)

  hidePhones: (callback) ->
    $(@phonesView.el).fadeOut "slow", ->
      callback() if callback?

  selectVendor: (vendor) ->
    @navigate("#{vendor.get('url')}", {trigger: true})