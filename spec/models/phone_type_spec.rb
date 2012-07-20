require 'spec_helper'

describe PhoneType do

  subject { create :phone_type }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end