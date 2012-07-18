require "faker"

FactoryGirl.define do

  factory :case_type do
    name {Faker::Name.name}
  end
end