class TouchScreenTypesController < ApplicationController
  respond_to :json

  def index
    respond_with(TouchScreenType.all)
  end
end
