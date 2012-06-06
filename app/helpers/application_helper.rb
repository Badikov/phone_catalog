module ApplicationHelper

  def root_path
    "#{ActionController::Base.config.relative_url_root}/"
  end
end
