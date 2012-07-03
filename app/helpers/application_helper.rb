module ApplicationHelper

  def link_to_page(page, label, prefix)
    link_to(label.html_safe, url_for(params.merge(page: page).select{ |k, v| !v.blank? }), "data-page" => page)
  end
end
