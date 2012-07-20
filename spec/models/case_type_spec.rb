require 'spec_helper'

describe CaseType do

  subject { create :case_type }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end