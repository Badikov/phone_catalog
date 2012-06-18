class PhoneCatalog.Collections.CaseTypes extends PhoneCatalog.Collections.LazyCollection

  model: PhoneCatalog.Models.CaseType
  url: ->
    PhoneCatalog.root + "api/case_types"