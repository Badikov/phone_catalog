require 'spec_helper'

describe CaseType do

  it "is invalid without name" do
    build(:case_type, name: nil).should be_invalid
  end

  it "is invalid with duplicate name" do
    create(:case_type, name: "classic")
    build(:case_type, name: "classic").should be_invalid
  end
end