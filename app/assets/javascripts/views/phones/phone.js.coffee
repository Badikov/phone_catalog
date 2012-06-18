class PhoneCatalog.Views.Phone extends Backbone.View

  tagName: "li"

  className: "span3"

  template: JST['phones/phone']

  events:
    "click": "selectPhone"

  render: ->
    $(@el).html(@template(phone: @model))
    @

  selectPhone: (event) ->
    event.preventDefault()
    Backbone.history.navigate(@model.path(), {trigger: true})