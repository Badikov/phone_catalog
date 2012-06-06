class PhoneCatalog.Models.Phone extends Backbone.Model

  image_url: ->
    "#{Backbone.history.options.root}img/#{@get('image')}"