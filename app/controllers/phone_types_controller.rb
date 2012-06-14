class PhoneTypesController < ApplicationController
  respond_to :json

  def index
    respond_with(PhoneType.all)
  end
end
