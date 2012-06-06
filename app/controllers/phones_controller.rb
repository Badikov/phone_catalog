class PhonesController < ApplicationController

  respond_to :json

  def index
    respond_with(Phone.by_vendor_url(params[:vendor]))
  end

  def show
    respond_with(Phone.find(params[:id]).as_json(
                     include: [:vendor, :case_type, :phone_type, :screen_type, :touch_screen_type, :platform]))
  end
end
