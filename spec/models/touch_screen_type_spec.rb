require 'spec_helper'

describe TouchScreenType do

  it "is invalid without name" do
    build(:touch_screen_type, name: nil).should be_invalid
  end

  it "is invalid with duplicate name" do
    create(:touch_screen_type, name: "resistive")
    build(:touch_screen_type, name: "resistive").should be_invalid
  end
end