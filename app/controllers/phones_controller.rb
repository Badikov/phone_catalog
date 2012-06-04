class PhonesController < ApplicationController

  respond_to :json

  def index
    respond_with(Phone.by_vendor(params[:vendor]))
  end
end
