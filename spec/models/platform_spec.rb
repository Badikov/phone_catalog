require 'spec_helper'

describe Platform do

  it "is invalid without name" do
    build(:platform, name: nil).should be_invalid
  end

  it "is invalid with duplicate name" do
    create(:platform, name: "android")
    build(:platform, name: "android").should be_invalid
  end
end