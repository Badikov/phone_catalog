class MainController < ApplicationController

  def vendors
    @current_page = :vendors
    @vendors = Vendor.all
  end
end
