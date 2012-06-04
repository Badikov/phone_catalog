class PhoneCatalog.Routers.Main extends Backbone.Router

  routes:
    '': "index"
    ':vendor': "phonesByVendor"

  initialize: ->
    @.on("all", -> console.log arguments)

  index: ->
    unless @vendorsView?
      @vendorsView = new PhoneCatalog.Views.VendorsIndex()
      @vendorsView.collection.on("select", @selectVendor, @)

    if @phonesView?
      @hidePhones(=> @showVendors())
    else
      @showVendors()

  phonesByVendor: (vendorName) ->
    if @vendorsView?
      @hideVendors(=> @showPhones(vendorName))
    else
      @showPhones(vendorName)

  selectVendor: (vendor) ->
    @navigate("#{vendor.get('name')}", {trigger: true})

  showVendors: ->
    $(@vendorsView.el).fadeIn "slow"
    $("#container").html(@vendorsView.el)

  hideVendors: (callback) ->
    $(@vendorsView.el).fadeOut "slow", ->
      callback()

  showPhones: (vendorName) ->
    @phonesView = new PhoneCatalog.Views.PhonesIndex() unless @phonesView?
    $(@phonesView.el).fadeIn("slow")
    $("#container").html(@phonesView.el)
    @phonesView.collection.fetchByVendor(vendorName)

  hidePhones: (callback) ->
    $(@phonesView.el).fadeOut "slow", ->
      callback()