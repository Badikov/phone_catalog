require 'faker'

FactoryGirl.define do

  factory :phone do
    name Faker::Name.name
    image {"#{name}.jpg".downcase.gsub(/\s/, "_")}
    vendor
    case_type
    phone_type
    platform
    screen_type
    touch_screen_type

    factory :nokia_e51 do
      name "Nokia E51"
      association :vendor, factory: :nokia
      contain_3g true
    end

    factory :nokia_6089 do
      name "Nokia 6089"
      association :vendor, factory: :nokia
      contain_3g false
    end

    factory :asus_j101 do
      name "ASUS J101"
      association :vendor, factory: :asus
      contain_3g true
    end
  end
end