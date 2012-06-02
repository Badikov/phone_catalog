class VendorsController < ApplicationController
  respond_to :json

  def index
    respond_with(Vendor.all)
  end
end
