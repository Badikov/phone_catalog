require 'spec_helper'

describe Vendor do

  subject { create :vendor }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should validate_presence_of(:url) }
  it { should validate_uniqueness_of(:url) }
end
