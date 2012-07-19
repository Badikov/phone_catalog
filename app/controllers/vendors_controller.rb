class VendorsController < ApplicationController

  def index
    @current_page = :vendors
    @vendors = Vendor.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @page = get_page
    per_page = 8
    vendor_url = params[:vendor_url]
    @vendor = Vendor.where(url: vendor_url).first
    @phones = Phone.by_vendor_url(vendor_url)
    @total_pages = get_total_pages(@phones.count, per_page)
    @phones = @phones.limit(per_page).offset((@page - 1) * per_page)
    respond_to do |format|
      format.html
    end
  end
end
