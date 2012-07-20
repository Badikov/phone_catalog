class VendorsController < ApplicationController

  def index
    @current_page = :vendors
    @vendors = Vendor.all
    respond_to do |format|
      format.html
    end
  end

  def show
    vendor_url = params[:vendor_url]
    @vendor = Vendor.where(url: vendor_url).first
    @phones = Phone.by_vendor_url(vendor_url).paginate(page: params[:page], per_page: 8)
    respond_to do |format|
      format.html
    end
  end
end
