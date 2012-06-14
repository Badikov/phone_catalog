class PhoneCatalog.Collections.CaseTypes extends PhoneCatalog.Collections.LazyCollection

  model: PhoneCatalog.Models.CaseType
  url: ->
    Backbone.history.options.root + "api/case_types"