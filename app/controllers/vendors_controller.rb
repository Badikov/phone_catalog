class VendorsController < ApplicationController

  def index
    @current_page = :vendors
    @vendors = Vendor.all
    respond_to do |format|
      format.html
      format.json{render json: @vendors}
    end
  end
end
