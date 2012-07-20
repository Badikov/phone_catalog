require 'spec_helper'

describe VendorsController do

  describe "GET #index" do
    before(:each) do
      @vendor = create :vendor
      get :index
    end

    it { should assign_to(:vendors).with([@vendor]) }
    it { should render_template :index }
  end

  describe "GET #show" do
    before(:each) do
      @vendor = mock_model(Vendor)
      Vendor.stub(:where).with(url: @vendor.url).and_return([@vendor])

      @phones = [double(Phone), double(Phone), double(Phone)]
      @phones.stub(:paginate).and_return(@phones)

      Phone.stub(:by_vendor_url).with(@vendor.url).and_return(@phones)

      get :show, vendor_url: @vendor.url
    end
  end
end