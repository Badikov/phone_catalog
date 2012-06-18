class PhoneCatalog.Collections.LazyCollection extends Backbone.Collection

  fetchIfEmpty: (callback) ->
    if @length is 0
      @fetch
        success: ->
          callback() if callback?
    else
      @trigger("reset")
      callback() if callback?