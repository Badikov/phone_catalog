class PhoneCatalog.Views.PhonesIndex extends PhoneCatalog.Views.FadingView

  tagName: "ul"
  className: "phones thumbnails"

  initialize: ->
    super
    @collection = new PhoneCatalog.Collections.Phones()
    @collection.on("reset", @render, @)

  render: ->
    if @visible
      @$el.fadeOut =>
        @$el.empty()
        @collection.each(@appendPhone, @)
        @$el.fadeIn()
    else
      @$el.empty()
      @collection.each(@appendPhone, @)
      @visible = true
    @

  appendPhone: (phone) ->
    phoneView = new PhoneCatalog.Views.Phone(model: phone, collection: @collection)
    @$el.append(phoneView.render().el)

  changePage: (page) ->
    @$el.fadeOut =>
      @render()
      @$el.fadeIn()