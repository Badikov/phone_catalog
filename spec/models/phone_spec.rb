require 'spec_helper'

describe Phone do

  describe "valid phone" do

    let(:phone) { create(:phone) }

    it { phone.should validate_presence_of(:name) }
    it { phone.should validate_uniqueness_of(:name) }

    it { phone.should validate_presence_of(:image) }
  end

  describe "filter" do
    let(:nokia_e51) {create(:nokia_e51)}
    let(:nokia_6089) {create(:nokia_6089)}
    let(:asus_j101) {create(:asus_j101)}

    describe "by vendor url" do

      context "when vendor url exists" do
        let(:nokia_url) {attributes_for(:nokia)[:url]}

        it "returns array of phones that match" do
          Phone.by_vendor_url(nokia_url).should include(nokia_e51, nokia_6089)
        end

        it "does not return phones that have another vendor" do
          Phone.by_vendor_url(nokia_url).should_not include(asus_j101)
        end
      end

      context "when vendor url does not exist" do
        it "return empty array" do
          Phone.by_vendor_url("not_exist_url").should == []
        end
      end
    end

    describe "by params" do
      let(:nokia_id) {create(:nokia).id}
      let(:search_params) { {vendor_id: nokia_id, contain_3g: "1"} }

      it "returns array of phones that match" do
        Phone.by_params(search_params).should include(nokia_e51)
      end

      it "does not return phones that have another params" do
        Phone.by_params(search_params).should_not include(nokia_6089, asus_j101)
      end

      it "ignores blank phone's params" do
        Phone.by_params({vendor_id: nokia_id, contain_3g: ""}).should include(nokia_6089, nokia_e51)
      end

      it "ignores not phone's params" do
        Phone.by_params({not_phone_reference_param: 123, not_phone_boolean_param: "0"}).should == []
      end
    end
  end
end