require 'spec_helper'

describe VendorsController do

  describe "GET #index" do
    it "populates an array of vendors" do
      vendor = create(:vendor)
      get :index
      assigns(:vendors).should == [vendor]
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    before(:each) do
      @nokia = create(:nokia)
      @nokia_e51 = create(:nokia_e51)
      @nokia_6089 = create(:nokia_6089)
      create(:asus_j101)
    end

    it "assigns requested vendor to @vendor" do
      get :show, vendor_url: @nokia.url
      assigns(:vendor).should == @nokia
    end

    it "populates array of phones filtered by vendor url" do
      get :show, vendor_url: @nokia.url
      assigns(:phones).should == [@nokia_e51, @nokia_6089]
    end

    it "renders :show view" do
      get :show
      response.should render_template :show
    end
  end
end