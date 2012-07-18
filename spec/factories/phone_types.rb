require "faker"

FactoryGirl.define do

  factory :phone_type do
    name {Faker::Name.name}
  end
end