class PhoneCatalog.Views.BreadcrumbsByVendor extends Backbone.View

  tagName: "ul"
  className: "breadcrumb"

  template: JST["phones/breadcrumbs_by_vendor"]

  initialize: ->
    @model.on('change', @render, @)

  render: ->
    @$el.html(@template(vendor: @model))
    @