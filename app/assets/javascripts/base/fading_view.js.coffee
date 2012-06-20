class PhoneCatalog.Views.FadingView extends Backbone.View

  initialize: (options) ->
    @visible = false
    if options?["display"] is false
      @$el.hide()

  show: (callback) ->
    @visible = true
    @$el.fadeIn ->
      callback() if callback?

  hide: (callback) ->
    @visible = false
    @$el.fadeOut ->
      callback() if callback?