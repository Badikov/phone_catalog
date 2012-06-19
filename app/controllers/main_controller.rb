class MainController < ApplicationController
  def index
  end

  def vendors
    @current_page = :vendors
  end
end
