class PhoneCatalog.Models.Phone extends Backbone.Model

  @referenceProperties = ->
    ["vendor", "phone_type", "case_type", "platform", "screen_type", "touch_screen_type"]
  @booleanProperties = ->
    ["contain_touch_screen", "contain_3g", "contain_wifi", "contain_bluetooth", "contain_gps",
    "contain_memory_card", "contain_mp3_player", "contain_radio", "contain_camera", "contain_double_sim_support"]

  image_url: ->
    "#{Backbone.history.options.root}img/#{@get('image')}"

  path: ->
    PhoneCatalog.root + "phones/#{@.get('id')}"
