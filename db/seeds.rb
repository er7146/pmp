# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

User.create! name: 'Dean Fallander' , 
  email: 'dfallander@pepperdines.com' , password: 'deanf@pmp1' , password_confirmation: 'deanf@pmp1'
User.create! name: 'Diane Drew' ,
  email: 'ddrew@pepperdines.com' , password: 'diane@pmp1' , password_confirmation: 'diane@pmp1'

Product.create! name: 'Stamps',
  image_filename: 'Pepp_logo.png',
  price_per_item: 100.00
Product.create! name: 'Business Cards',
  image_filename: 'Pepp_logo.png',
  price_per_item: 29.99
Product.create! name: 'Banners',
  image_filename: 'Pepp_logo.png',
  price_per_item: 99.00 
Product.create! name: 'Brochures',
  image_filename: 'Pepp_logo.png',
  price_per_item: 250.00

ShipMethod.create! name: "Ground",
  price_per_cart: 10.00,
  price_per_item: 0.10
ShipMethod.create! name: "2nd Day",
  price_per_cart: 15.00,
  price_per_item: 0.10