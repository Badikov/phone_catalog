class PhonesController < ApplicationController

  def index
    @page = params[:page] ? params[:page].to_i : 1
    @page = 1 if @page == 0
    respond_to do |format|
      format.html do
        per_page = 8
        vendor_url = params[:vendor_url]
        @phones = Phone.by_vendor_url(vendor_url)
        @total_pages = get_total_pages(@phones.count, per_page)
        @phones = @phones.limit(per_page)
        @vendor = Vendor.where(url: vendor_url).first
      end
      format.json do
        per_page = params[:per_page] ? params[:per_page].to_i : 6
        per_page = 6 if per_page == 0
        phones = Phone.by_params(params)
        total_pages = get_total_pages(phones.count, per_page)
        phones = phones.limit(per_page).offset((@page - 1) * per_page)
        render json: {total_pages: total_pages, page: @page, phones: phones.as_json(only: [:id, :name, :image])}
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

  private

  def get_total_pages(count, per_page)
    count / per_page + ((count % per_page) > 0 ? 1 : 0)
  end
end
