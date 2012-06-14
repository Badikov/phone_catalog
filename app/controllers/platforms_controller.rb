class PlatformsController < ApplicationController
  respond_to :json

  def index
    respond_with(Platform.all)
  end
end
