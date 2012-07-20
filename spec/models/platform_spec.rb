require 'spec_helper'

describe Platform do

  subject { create :platform }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end