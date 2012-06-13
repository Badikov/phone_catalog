class PhoneCatalog.Views.FadingView extends Backbone.View

  initialize: (options) ->
    unless options?["hidden"] is false
      @$el.hide()

  show: (callback) ->
    @$el.fadeIn ->
      callback() if callback?

  hide: (callback) ->
    @$el.fadeOut ->
      callback() if callback?