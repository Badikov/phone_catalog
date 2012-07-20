require "spec_helper"

describe ScreenType do

  subject { create :screen_type }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end