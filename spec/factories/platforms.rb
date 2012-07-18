require "faker"

FactoryGirl.define do

  factory :platform do
    name {Faker::Name.name}
  end
end