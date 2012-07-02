module ApplicationHelper

  def link_to_page(page, label, prefix)
    if params[:noscript]
      link_to(label.html_safe, url_for(params.merge(page: page)))
    else
      link_to(label.html_safe, "#{root_path}#{prefix}page#{page}", "data-page" => page)
    end
  end
end
