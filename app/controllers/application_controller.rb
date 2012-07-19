class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def get_total_pages(count, per_page)
    count / per_page + ((count % per_page) > 0 ? 1 : 0)
  end

  def get_page
    page = params[:page] ? params[:page].to_i : 1
    page = 1 if page == 0
    page
  end
end
