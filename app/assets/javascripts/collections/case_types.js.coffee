class PhoneCatalog.Collections.CaseTypes extends Backbone.Collection

  model: PhoneCatalog.Models.CaseType
  url: ->
    PhoneCatalog.root + "api/case_types"