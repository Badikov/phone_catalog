module ApplicationHelper

  def relative_url_root
    "#{ActionController::Base.config.relative_url_root}/"
  end
end
