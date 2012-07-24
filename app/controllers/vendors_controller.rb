class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
    respond_to do |format|
      format.html
    end
  end

  def show
    vendor_url = params[:vendor_url]
    @vendor = Vendor.where(url: vendor_url).first
    @phones = Phone.by_vendor_url(vendor_url).page(params[:page]).per(8)
    respond_to do |format|
      format.html
    end
  end
end
