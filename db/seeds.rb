# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user1 = User.create!(email: "edouard.vaudour@icloud.com", password: "azerty", first_name: "Edouard", last_name: "Vaudour", company: "Luma")
user2 = User.create!(email: "adamdylan.p@gmail.com", password: "azerty", first_name: "Dylan", last_name: "Adam", company: "Space x")
user3 = User.create!(email: "claire.edith.demont@gmail.com", password: "azerty", first_name: "Claire", last_name: "Demont", company: "Monsanto")
9.times do
  Experience.create!(title: ["Escape Game", "Laser game", "Bowling", "VR laser game", "Paintball", "Wine tasting", "Boat Party"].sample, description: Faker::TvShows::HowIMetYourMother.quote, address:Faker::Address.street_address, price: Faker::Commerce.price, capacity_min: rand(1..15), validity_date: Faker::Date.forward(30), category: ["Indoor", "Outdoor", "Culture", "Fun", "Extreme"].sample, picture: Faker::LoremPixel.image, user: User.all.sample)
end

booking1 = Booking.create!(date: Faker::Date.forward(30), number_of_participants: rand(1..15), user: user1, experience: Experience.all.sample)
booking2 = Booking.create!(date: Faker::Date.forward(30), number_of_participants: rand(1..15), user: user2, experience: Experience.all.sample)
booking3 = Booking.create!(date: Faker::Date.forward(30), number_of_participants: rand(1..15), user: user3, experience: Experience.all.sample)

review1 = Review.create!(description: Faker::Movies::StarWars.quote, rating: rand(0..5), booking: booking1)
review2 = Review.create!(description: Faker::Movies::StarWars.quote, rating: rand(0..5), booking: booking2)
review3 = Review.create!(description: Faker::Movies::StarWars.quote, rating: rand(0..5), booking: booking3)
