class PhoneCatalog.Views.Vendor extends Backbone.View
  tagName: "li"
  className: "span2"

  template: JST["vendors/vendor"]

  events:
    "click a": "selectVendor"

  render: ->
    $(@el).html(@template(vendor: @model))
    @

  selectVendor: (event) ->
    event.preventDefault()
    Backbone.history.navigate(@model.path(), {trigger: true})