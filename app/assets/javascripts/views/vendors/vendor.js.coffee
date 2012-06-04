class PhoneCatalog.Views.Vendor extends Backbone.View
  tagName: "li"
  className: "span3"

  template: JST["vendors/vendor"]

  events:
    "click a": "selectVendor"

  render: ->
    $(@el).html(@template(vendor: @model))
    @

  selectVendor: (event) ->
    event.preventDefault()
    @collection.trigger("select", @model)