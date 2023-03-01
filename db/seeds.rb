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
User.destroy_all
Shoe.destroy_all

puts "Creating new users"

10.times do
  User.create(email: Faker::Internet.email, password: "123456")
end

puts "created #{User.count} users"
puts "createing new shoes"
urls = [
  'https://images.unsplash.com/photo-1552346154-21d32810aba3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c25lYWtlcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1562424995-2efe650421dd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG5pa2UlMjBzbmVha2Vyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1512374382149-233c42b6a83b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bmlrZSUyMHNuZWFrZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1524532787116-e70228437bbe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fG5pa2UlMjBzbmVha2Vyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1618898909019-010e4e234c55?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fG5pa2UlMjBzbmVha2Vyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1514989940723-e8e51635b782?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fG5pa2UlMjBzbmVha2Vyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1588361861040-ac9b1018f6d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG5pa2UlMjBzbmVha2Vyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bmlrZSUyMHNuZWFrZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1562687782-9f2fd422a334?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bmlrZSUyMHNuZWFrZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1600269452121-4f2416e55c28?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c25lYWtlcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60'
]
i = 0
User.all.each do |user|
  img = urls[i]
  file = URI.open(img)
  shoe = Shoe.new(title: Faker::Team.state, description: Faker::Team.name, price: rand(200..1500), sizes: rand(30..47))
  shoe.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  shoe.user = user
  shoe.save
  i += 1
end
puts "created #{Shoe.count} shoes"
