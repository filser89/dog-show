# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

User.destroy_all
Dog.destroy_all
Breed.destroy_all


# creating a test user
user = User.create!(email: "user@email.com", password: 123456)

# seeding breeds
url = 'https://dog.ceo/api/breeds/list/all'
res = open(url).read
breeds_hash = JSON.parse(res)["message"]
breeds_arr = []
breeds_hash.each do |k, v|
  v.empty? ? breeds_arr.push(k.capitalize) : v.each {|b| breeds_arr.push("#{b.capitalize} #{k.capitalize}") }
end
breeds_arr.each do |b|
  breed = Breed.create!(name: b)
  puts "Created #{breed.name}"
end

puts "Created #{Breed.count} breeds!"
puts "=================================================="

30.times do
  dog = Dog.create!(name: Faker::Creature::Dog.name, description: Faker::Creature::Dog.meme_phrase, user: user, breed: Breed.all.sample)
  puts "Created #{dog.name}. It's breed is #{dog.breed}!"
end

puts "Created #{Dog.count} dogs!"
puts "=================================================="
