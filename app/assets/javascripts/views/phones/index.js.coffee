class PhoneCatalog.Views.PhonesIndex extends Backbone.View

  id: "phones-index"
  className: "row tab-pane fade"

  template: JST['phones/index']

  initialize: ->
    @collection = new PhoneCatalog.Collections.Phones()
    @collection.on("reset", @render, @)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendPhone, @)
    @

  appendPhone: (phone) ->
    phoneView = new PhoneCatalog.Views.Phone(model: phone)
    @$("#phones").append(phoneView.render().el)

  show: ->
    $("a[href='##{@id}']").tab('show')