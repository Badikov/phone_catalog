module ApplicationHelper

  def link_to_page(page, label)
    link_to(label.html_safe, url_for(params.merge(page: page).select{ |k, v| !v.blank? }), "data-page" => page)
  end

  def page_title(title)
    content_for :title do
      "#{title} - #{t('phone_catalog')}"
    end
  end
end
