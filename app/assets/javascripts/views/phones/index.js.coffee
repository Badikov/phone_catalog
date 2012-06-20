class PhoneCatalog.Views.PhonesIndex extends PhoneCatalog.Views.FadingView

  tagName: "ul"
  className: "phones thumbnails"

  initialize: ->
    super
    @_attachExistentDOM()
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

  _attachExistentDOM: ->
    phones = @collection
    @$('li').each (phoneElIndex, phoneEl) ->
      phone_id = $(phoneEl).data("id")
      phone = phones.get(phone_id)
      new PhoneCatalog.Views.Phone(el: phoneEl, model: phone)