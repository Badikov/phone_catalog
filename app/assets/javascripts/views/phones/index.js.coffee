class PhoneCatalog.Views.PhonesIndex extends PhoneCatalog.Views.FadingView

  tagName: "ul"
  className: "phones thumbnails"

  initialize: ->
    super
    @collection = new PhoneCatalog.Collections.Phones()
    @collection.on("reset", @render, @)

  render: ->
    subrender = =>
      @$el.empty()
      @collection.each(@appendPhone, @)
    if @visible
      @$el.fadeOut =>
        subrender()
        @$el.fadeIn()
    else
      subrender()
      @visible = true
    @

  appendPhone: (phone) ->
    phoneView = new PhoneCatalog.Views.Phone(model: phone, collection: @collection)
    @$el.append(phoneView.render().el)
