class PhonesController < ApplicationController

  respond_to :json

  def index
    if params[:vendor]
      respond_with(Phone.by_vendor_url(params[:vendor]).as_json(only: [:id, :name, :image]))
    else
      respond_with(Phone.by_params(params).as_json(only: [:id, :name, :image]))
    end
  end

  def show
    respond_with(Phone.find(params[:id]).as_json(
                     include: [:vendor, :case_type, :phone_type, :screen_type, :touch_screen_type, :platform]))
  end
end
