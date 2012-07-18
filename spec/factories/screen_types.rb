require "faker"

FactoryGirl.define do

  factory :screen_type do
    name {Faker::Name.name}
  end
end