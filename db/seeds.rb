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

puts "users created"

9.times do
  Experience.create!(title: ["Escape Game", "Laser game", "Bowling", "VR laser game", "Paintball", "Wine tasting", "Boat Party"].sample, description: Faker::TvShows::HowIMetYourMother.quote, address:Faker::Address.street_address, price: Faker::Commerce.price, capacity_min: rand(1..15), validity_date: Faker::Date.forward(30), category: ["Indoor", "Outdoor", "Culture", "Fun", "Extreme"].sample, picture: Faker::LoremPixel.image, user: User.all.sample, duration: ["3h", "2h", "2h30", "1h", "1h30", "50min"].sample)
end

puts "9 experiences created"

@description = "Vagabund Brauerei not only wants to make beer for people to drink, but we also want to get people involved in the beer making process. That's why we offer brew courses to beginners, who want to have a better handle on how beer is made. The beginner's course is also good for homebrewers who want to have a look at what goes into brewing on a small industrial sized brew system. A course consists of a small group of people in order to make it more personal. We get started at 10:30 and go until 17:00. The course includes coffee, beers, snacks, lunch, and a free glass of the finished beer once the beer is ready to be served. Participation costs €125 (including tax) per person. If interested, please send an email to info@vagabundbrauerei.com."
Experience.create!(title: "Beer brewing workshop", description: @description, address:"5 rue du sentier, 75002 PARIS", price: 40, capacity_min: 5, validity_date: Faker::Date.forward(30), category: "Indoor", picture: Faker::LoremPixel.image, user: User.all.sample, duration: "3h")


booking1 = Booking.create!(date: Faker::Date.forward(30), number_of_participants: rand(1..15), user: user1, experience: Experience.all.sample)
booking2 = Booking.create!(date: Faker::Date.forward(30), number_of_participants: rand(1..15), user: user2, experience: Experience.all.sample)
booking3 = Booking.create!(date: Faker::Date.forward(30), number_of_participants: rand(1..15), user: user3, experience: Experience.all.sample)

review1 = Review.create!(description: Faker::Movies::StarWars.quote, rating: rand(0..5), booking: booking1)
review2 = Review.create!(description: Faker::Movies::StarWars.quote, rating: rand(0..5), booking: booking2)
review3 = Review.create!(description: Faker::Movies::StarWars.quote, rating: rand(0..5), booking: booking3)

# Testing Photos Upload
url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
experience = Experience.new(title: 'Test', description: "The best experience")
experience.remote_photo_url = url
experience.save


