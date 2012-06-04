class PhonesController < ApplicationController

  respond_to :json

  def index
    respond_with(Phone.by_vendor_url(params[:vendor]))
  end
end
