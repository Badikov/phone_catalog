require 'spec_helper'

describe PhonesController do

  describe "GET #index" do
    before(:each) do
      @phones = [mock_model(Phone), mock_model(Phone), mock_model(Phone)]
      stub_kaminari_methods(@phones)
      @phones.stub(:as_json).and_return(@phones.map { |p| {id: p.id, name: p.name, image: p.image} })
      Phone.stub(:by_params).and_return(@phones)
    end

    context "when request format is html" do
      before(:each) do
        get :index
      end

      it { should assign_to(:phones).with(@phones) }
      it { should render_template :index }
    end

    context "when request format is json" do
      it "render array of phones as json" do
        get :index, format: :json
        response.body.should == {total_pages: @phones.num_pages, page: @phones.current_page, phones: @phones.as_json}.to_json
      end
    end
  end

  describe "GET #show" do
    before(:each) do
      @phone = mock_model(Phone)
      Phone.stub(:find).and_return(@phone)
      @phone.stub(:as_json) do
        {id: @phone.id, name: @phone.name, image: @phone.image}
      end
    end

    context "when request format is html" do
      before(:each) do
        get :show, id: @phone
      end
      it { should assign_to(:phone).with(@phone) }
      it { should render_template :show }
    end

    context "when request format is json" do
      it "render phone as json" do
        get :show, {id: @phone, format: :json}
        response.body.should == @phone.to_json
      end
    end
  end
end