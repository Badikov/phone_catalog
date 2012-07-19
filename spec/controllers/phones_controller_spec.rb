require 'spec_helper'

describe PhonesController do

  describe "GET #index" do
    let(:nokia) {create(:nokia)}
    before(:each) do
      @nokia_e51 = create(:nokia_e51)
      create(:nokia_6089)
      create(:asus_j101)
    end

    context "when request format is html" do
      it "populates array of phones filtered by params" do
        get :index, {vendor_id: nokia.id, contain_3g: "1"}
        assigns(:phones).should == [@nokia_e51]
      end

      it "render :index view" do
        get :index
        response.should render_template :index
      end
    end

    context "when request format is json" do
      it "render array of phones filtered by params as json" do
        get :index, {vendor_id: nokia.id, contain_3g: "1", format: :json}
        response.body.should == {total_pages: 1, page: 1, phones: [@nokia_e51.as_json(only: [:id, :name, :image])]}.to_json
      end
    end
  end

  describe "GET #show" do
    let(:phone) {create(:phone)}

    context "when request format is html" do
      it "assigns requested phone to @phone" do
        get :show, id: phone
        assigns[:phone].should == phone
      end

      it "render :show view" do
        get :show, id: phone
        response.should render_template(:show)
      end
    end

    context "when request format is json" do
      it "render phone as json" do
        get :show, {id: phone, format: :json}
        response.body.should == phone.
          as_json(include: [:vendor, :case_type, :phone_type, :screen_type, :touch_screen_type, :platform]).
          to_json
      end
    end
  end
end