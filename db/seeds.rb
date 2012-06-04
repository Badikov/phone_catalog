# encoding: utf-8

require Rails.root + 'lib/phone_data/phones_init_data_parser'

# Vendors
File.open('lib/phone_data/vendor_list.txt', 'r:utf-8').each_line do |vendor|
  vendor_data = vendor.split("|")
  vendor_name = vendor_data[0].strip
  vendor_url = vendor_data[1]
  vendor_url = vendor_name.downcase.gsub(/\s/,"-") if vendor_url.nil?
  vendor_url = vendor_url.strip
  Vendor.create(name: vendor_name, url: vendor_url)
end

#Case types
CaseType.create([{name: 'классический'}, {name: 'раскладушка'}, {name: 'ротатор'},
                 {name: 'с откидной крышкой'}, {name: 'слайдер'}, {name: 'часы'}])

# Phone types
PhoneType.create([{name: 'смартфон/коммуникатор'}, {name: 'телефон'}])

# Platforms
File.open('lib/phone_data/platform_list.txt', 'r:utf-8').each_line do |platform_name|
  Platform.create(name: platform_name.strip)
end

# Screen types
File.open('lib/phone_data/screen_type_list.txt', 'r:utf-8').each_line do |screen_type_name|
  ScreenType.create(name: screen_type_name.strip)
end

# Touch screen types
TouchScreenType.create([{name: 'емкостный'}, {name: 'резистивный'}])

# Phones
PhonesInitDataParser.new.parse_and_seed