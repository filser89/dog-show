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

#  methods
def save_dog_img(breed)
  url = breed.subbreed ? "https://dog.ceo/api/breed/#{breed.breed_category}/#{breed.subbreed}/images/random" : "https://dog.ceo/api/breed/#{breed.breed_category}/images/random"
  res = open(url).read
  img_url = JSON.parse(res)["message"]
  URI.open(img_url)
end

# creating a user
user = User.create!(email: "user@email.com", password: 123456)

# seeding breeds from https://dog.ceo/
url = 'https://dog.ceo/api/breeds/list/all'
res = open(url).read
breeds_hash = JSON.parse(res)["message"]
breeds_arr = []
breeds_hash.each do |k, v|
  if v.empty?
    breed = Breed.create!(breed_category: k)
    puts "Created #{breed.to_s}"
  else
    v.each do |v|
      breed = Breed.create!(breed_category: k, subbreed: v)
      puts "Created #{breed.to_s}"
    end
  end
end


puts "Created #{Breed.count} breeds!"
puts "=================================================="

# creating dogs
30.times do
  dog = Dog.create!(name: Faker::Creature::Dog.name, description: Faker::Creature::Dog.meme_phrase, user: user, breed: Breed.all.sample, age: (0..192).to_a.sample, gender: Dog::GENDERS.sample)
  dog.photos.attach(io: save_dog_img(dog.breed), filename: "#{dog.name.downcase}.jpg", content_type: 'image/jpg')
  dog.save
  puts "Created #{dog.name}. It's breed is #{dog.breed.to_s}!"
end

puts "Created #{Dog.count} dogs!"
puts "=================================================="
