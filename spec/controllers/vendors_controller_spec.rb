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
      stub_kaminari_methods(@phones)
      Phone.stub(:by_vendor_url).with(@vendor.url).and_return(@phones)

      get :show, vendor_url: @vendor.url
    end

    it { should assign_to(:vendor).with(@vendor) }
    it { should assign_to(:phones).with(@phones) }
    it { should render_template :show }
  end
end