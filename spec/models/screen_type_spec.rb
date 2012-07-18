require "spec_helper"

describe ScreenType do

  it "is invalid without name" do
    build(:screen_type, name: nil).should be_invalid
  end

  it "is invalid with duplicate name" do
    create(:screen_type, name: "TFT")
    build(:screen_type, name: "TFT").should be_invalid
  end
end