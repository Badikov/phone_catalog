# encoding: utf-8

# Vendors
File.open('lib/phone_data/vendor_list.txt').each_line do |vendor_name|
  Vendor.create(name: vendor_name)
end

#Case types
CaseType.create([{name: 'классический'}, {name: 'раскладушка'}, {name: 'ротатор'},
                 {name: 'с откидной крышкой'}, {name: 'слайдер'}, {name: 'часы'}])

# Types
Type.create([{name: 'смартфон/коммуникатор'}, {name: 'телефон'}])

# Platforms
File.open('lib/phone_data/platform_list.txt').each_line do |platform_name|
  Platform.create(name: platform_name)
end

# Screen types
File.open('lib/phone_data/screen_type_list.txt').each_line do |screen_type_name|
  ScreenType.create(name: screen_type_name)
end