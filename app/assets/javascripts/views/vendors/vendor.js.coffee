class PhoneCatalog.Views.Vendor extends Backbone.View
  tagName: "li"
  className: "span3"

  template: JST["vendors/vendor"]

  render: ->
    console.log @model
    $(@el).html(@template(vendor: @model))
    @