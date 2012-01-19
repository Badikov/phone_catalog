# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Vendors
File.open('lib/phone_data/vendor_list.txt').each_line do |vendor_name|
  Vendor.create(name: vendor_name)
end

#Case types
CaseType.create([{name: 'классический'}, {name: 'раскладушка'}, {name: 'ротатор'},
                 {name: 'с откидной крышкой'}, {name: 'слайдер'}, {name: 'часы'}])

