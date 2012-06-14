class CaseTypesController < ApplicationController
  respond_to :json

  def index
    respond_with(CaseType.all)
  end
end
