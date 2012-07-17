require 'spec_helper'

describe Vendor do
  
  it "is invalid without name" do
    build(:vendor, name: nil).should be_invalid
  end

  it "is invalid without url" do
    build(:vendor, url: nil).should be_invalid    
  end

  it "is invalid with duplicate name" do
    create(:nokia, name: "ASUS")
    build(:asus, name: "ASUS").should be_invalid
  end

  it "is invalid with duplicate url" do
    create(:nokia, url: "asus")
    build(:asus, url: "asus").should be_invalid
  end  
end
