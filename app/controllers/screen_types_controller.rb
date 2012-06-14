class ScreenTypesController < ApplicationController
  respond_to :json

  def index
    respond_with(ScreenType.all)
  end
end
