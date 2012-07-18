require 'faker'

FactoryGirl.define do

  factory :touch_screen_type do
    name {Faker::Name.name}
  end
end