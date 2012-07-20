require 'spec_helper'

describe TouchScreenType do

  subject { create :touch_screen_type }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end