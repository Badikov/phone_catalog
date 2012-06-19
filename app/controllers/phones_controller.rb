class PhonesController < ApplicationController

  respond_to :json

  def index
    page = params[:page] ? params[:page].to_i : 1
    page = 1 if page == 0
    per_page = params[:per_page] ? params[:per_page].to_i : 6
    per_page = 6 if per_page == 0
    phones = Phone.by_params(params)
    count = phones.count
    phones = phones.limit(per_page).offset((page - 1) * per_page)
    total_pages = count / per_page + ((count % per_page) > 0 ? 1 : 0)
    respond_with(total_pages: total_pages, page: page, phones: phones.as_json(only: [:id, :name, :image]))
  end

  def show
    respond_with(Phone.find(params[:id]).as_json(
                     include: [:vendor, :case_type, :phone_type, :screen_type, :touch_screen_type, :platform]))
  end
end
