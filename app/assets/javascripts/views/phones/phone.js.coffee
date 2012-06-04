class PhoneCatalog.Views.Phone extends Backbone.View

  tagName: "li"

  className: "span3"

  template: JST['phones/phone']

  render: ->
    $(@el).html(@template(phone: @model))
    @