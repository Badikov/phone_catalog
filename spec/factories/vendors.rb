require "faker"

FactoryGirl.define do

  factory :vendor do
    name {Faker::Name.name}
    url {Faker::Internet.domain_word}
  end

  factory :asus, class: Vendor do
    name "ASUS"
    url "asus"
    initialize_with { Vendor.find_or_create_by_name(name) }
  end

  factory :nokia, class: Vendor do
    name "Nokia"
    url "nokia"
    initialize_with { Vendor.find_or_create_by_name(name) }
  end
end