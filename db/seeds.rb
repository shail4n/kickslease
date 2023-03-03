# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
require "nokogiri"
require "faker"

puts "Cleaning database"
Shoe.destroy_all
User.destroy_all

puts "Creating new users"

16.times do
  User.create(email: Faker::Internet.email, password: "123456")
end

puts "created #{User.count} users"
puts "createing new shoes"
urls = [
  'http://cdn.shopify.com/s/files/1/0270/5326/0848/collections/yeezy-foam-runner-vermillion-GW3355-GX1136-GX1137-store-list_grande.jpg?v=1664461328',
  'https://images.unsplash.com/photo-1552346154-21d32810aba3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c25lYWtlcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1562424995-2efe650421dd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG5pa2UlMjBzbmVha2Vyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1512374382149-233c42b6a83b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bmlrZSUyMHNuZWFrZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://i.pinimg.com/564x/7f/0e/5f/7f0e5fe5f4569138f224ab00d176ae70.jpg',
  'https://i.pinimg.com/564x/43/3d/f0/433df06d0ef94606718bdbfd047e179b.jpg',
  'https://i.pinimg.com/564x/1e/a5/a7/1ea5a7c3e61b111ac46778b788c517c8.jpg',
  'https://images.unsplash.com/photo-1524532787116-e70228437bbe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fG5pa2UlMjBzbmVha2Vyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://sneakernews.com/wp-content/uploads/2022/03/yeezy-350-beige-black-2.jpg',
  'https://i.pinimg.com/564x/07/9a/97/079a97df29982c8aba3c931f7ad2483b.jpg',
  'https://i.pinimg.com/564x/da/55/55/da5555320f28db25618887de774051fe.jpg',
  'https://images.unsplash.com/photo-1514989940723-e8e51635b782?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fG5pa2UlMjBzbmVha2Vyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://i.pinimg.com/564x/da/3e/70/da3e70f0ff01ba1ea079a1a59437561a.jpg',
  'https://images.unsplash.com/photo-1588361861040-ac9b1018f6d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG5pa2UlMjBzbmVha2Vyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bmlrZSUyMHNuZWFrZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1600269452121-4f2416e55c28?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c25lYWtlcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60'
]
shoe_titles = [
  "Nike Air Force 1 '07 LV8",
  "Adidas Yeezy Boost 350 V2",
  "Jordan Delta 2",
  "New Balance 990v5",
  "Reebok Classic Leather",
  "Converse Chuck 70",
  "Puma Calibrate Runner",
  "Vans Old Skool",
  "Asics Gel-Lyte III",
  "Under Armour Curry 8",
  "Fila Disruptor II",
  "On Cloud X",
  "Hoka One One Clifton 8",
  "Brooks Ghost 14",
  "Saucony Kinvara 12",
  "Mizuno Wave Rider 25"
]

shoe_descriptions = [
  "A classic silhouette",
  "One of the Yeezy Boost models",
  "A versatile sneaker",
  "A retro running shoe",
  "An all-time favorite",
  "An iconic sneaker",
  "Sleek and stylish",
  "The original skate shoe",
  "A retro runner",
  "The latest trend",
  "A sneaker with a bold look",
  "A responsive running shoe",
  "A top-rated running shoe",
  "A fan-favorite running",
  "A responsive trainer for runners",
  "A comfortable running shoe"
]
i = 0
User.all.each do |user|
  img = urls[i]
  file = URI.open(img)
  shoe = Shoe.new(title: shoe_titles[i], description: shoe_descriptions[i], price: rand(50..1000), sizes: rand(30..47))
  shoe.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  shoe.user = user
  shoe.save
  i += 1
end
puts "created #{Shoe.count} shoes"
