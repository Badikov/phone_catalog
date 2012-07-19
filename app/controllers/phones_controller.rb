class PhonesController < ApplicationController

  def index
    @current_page = :search
    per_page = params[:per_page].blank? ? 6 : params[:per_page].to_i
    @page = get_page
    @phones = Phone.by_params(params)
    @total_pages = get_total_pages(@phones.count, per_page)
    @phones = @phones.limit(per_page).offset((@page - 1) * per_page)
    respond_to do |format|
      format.html
      format.json do
        render json: {total_pages: @total_pages, page: @page, phones: @phones.as_json(only: [:id, :name, :image])}
      end
    end
  end

  def show
    @phone = Phone.find(params[:id])
    respond_to do |format|
      format.html
      format.json do
        render json: @phone.as_json(
            include: [:vendor, :case_type, :phone_type, :screen_type, :touch_screen_type, :platform])
      end
    end
  end
end
