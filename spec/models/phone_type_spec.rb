require 'spec_helper'

describe PhoneType do

  it "is invalid without name" do
    build(:phone_type, name: nil).should be_invalid
  end

  it "is invalid with duplicate name" do
    create(:phone_type, name: "smartphone")
    build(:phone_type, name: "smartphone").should be_invalid
  end
end