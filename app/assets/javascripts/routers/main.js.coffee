class PhoneCatalog.Routers.Main extends Backbone.Router

  routes:
    '': "home"
    'search': "search"
    ':vendor': "phonesByVendor"
    'phones/:phoneId': "phoneDetails"

  initialize: ->
    @.on("all", -> console.log arguments)
    navigation = new PhoneCatalog.Views.Navigation(router: @)
    $('body').append(navigation.el)
    mainView = new PhoneCatalog.Views.Main(router: @)
    $('body').append(mainView.render().el)
