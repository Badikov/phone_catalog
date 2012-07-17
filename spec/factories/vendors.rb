FactoryGirl.define do

  factory :vendor do
    name "VendorName"
    url "vendor-url"    
  end

  factory :asus, class: Vendor do
    name "ASUS"
    url "asus"    
  end

  factory :nokia, class: Vendor do
    name "Nokia"
    url "nokia"    
  end
end