class PhonesController < ApplicationController

  def index
    @current_page = :search
    per_page = params[:per_page].blank? ? 6 : params[:per_page].to_i
    @phones = Phone.by_params(params).paginate(page: params[:page], per_page: per_page)
    respond_to do |format|
      format.html
      format.json do
        render json: {total_pages: @phones.total_pages, page: @phones.current_page, phones: @phones.as_json(only: [:id, :name, :image])}
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
