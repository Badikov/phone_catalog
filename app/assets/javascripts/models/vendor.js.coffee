class PhoneCatalog.Models.Vendor extends Backbone.Model

  path: ->
    PhoneCatalog.root + @.get('url')