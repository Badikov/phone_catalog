require 'spec_helper'

describe PhonesHelper do
  describe "phones search params" do
    it "returns not blank request params which are phone's attributes" do
      controller.params = { "vendor_id" => "1", "contain_3g" => "1", "phone_type_id" => "", "not_phone_attribute" => "value"}
      helper.phone_search_params.should have(2).params
    end
  end
end
