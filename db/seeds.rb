# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

CITIES = %w( Paris Lyon Montpellier Toulouse Marseille Lille Strasbourg Bordeaux )

10.times do
  user_name = Faker::Name.first_name
  user = User.New(
    pseudo: "#{user_name}#{rand(1..99)}",
    email: Faker::Internet.email(name: user_name),
    password: Faker::Internet.password(min_length: 8, max_length: 12),
    rating: rand(2.0..4.99).round(2)
  )
  user.save
end


18.times do
  unicorn_names = [Faker::Artist.name, Faker::TvShows::Friends.character, Faker::Movies::LordOfTheRings.character, Faker::DcComics.hero, Faker::DcComics.heroine, Faker::TvShows::GameOfThrones.character]
  unicorn = Unicorn.new(
    name: unicorn_names.sample,
    magic_power: MAGIC_POWERS.sample,
    description: Faker::Lorem.paragraph(sentence_count: rand(2..6)),
    location: CITIES.sample,
    price: rand(350.0..1050.0).round(2),
    user: User.all.to_a.sample
  )
  unicorn.save
end

30.times do
  booking_start_date = Faker::Date.between(from: '2020-08-26', to: '2020-09-10')
  unicorn = Unicorn.all.to_a.sample
  bookings = Booking.new(
    start_date: booking_start_date,
    end_date: Faker::Date.between(from: booking_start_date, to: '2020-09-15'),
    rating: rand(1..5),
    review: Faker::Lorem.paragraph(sentence_count: rand(1..5)),
    unicorn: unicorn,
    user: User.where.not(unicorn: unicorn)
  )
  booking.save
end



