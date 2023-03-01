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
User.all.each do |user|
  img = Faker::LoremFlickr.pixelated_image(size: "50x60", search_terms: ['sneaker'])
  file = URI.open(img)
  shoe = Shoe.new(title: Faker::Team.state, description: Faker::Team.name, price: rand(200..1500), sizes: rand(30..47))
  shoe.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  shoe.user = user
  shoe.save
end
puts "created #{Shoe.count} shoes"
