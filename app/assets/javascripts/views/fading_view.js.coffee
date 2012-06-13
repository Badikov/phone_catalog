class PhoneCatalog.Views.FadingView extends Backbone.View

  initialize: ->
    @$el.hide()

  show: (callback) ->
    @$el.fadeIn ->
      callback() if callback?

  hide: (callback) ->
    @$el.fadeOut ->
      callback() if callback?