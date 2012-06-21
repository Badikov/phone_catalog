module ApplicationHelper

  def relative_url_root
    root = ActionController::Base.config.relative_url_root
    root = root[1..root.length] if root
    "#{root}/"
  end
end
