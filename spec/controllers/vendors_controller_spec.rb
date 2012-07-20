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
      @phones.stub(:limit).and_return(@phones)
      @phones.stub(:offset).and_return(@phones)
      @phones.stub(:count).and_return(@phones.length)

      Phone.stub(:by_vendor_url).with(@vendor.url).and_return(@phones)
    end

    context "always" do
      before(:each) do
        get :show, vendor_url: @vendor.url
      end

      it { should assign_to(:vendor).with(@vendor) }
      it { should assign_to(:phones).with(@phones) }
      it { should render_template :show }
      it { should assign_to(:total_pages) }
    end

    context "when page did not request" do
      before(:each) do
        get :show, vendor_url: @vendor.url
      end

      it { should assign_to(:page).with(1) }
    end

    context "when page requested" do
      before(:each) do
        @page = 2
        get :show, vendor_url: @vendor.url, page: @page
      end

      it { should assign_to(:page).with(@page) }
    end
  end
end