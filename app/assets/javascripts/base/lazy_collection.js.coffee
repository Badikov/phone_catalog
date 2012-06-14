class PhoneCatalog.Collections.LazyCollection extends Backbone.Collection

  fetchIfEmpty: (callback) ->
    if @length is 0
      @fetch
        success: ->
          callback() if callback?
    else
      callback() if callback?