# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# # TODO: Write a seed to insert 100 posts in the database
puts "Creating seeds..."
Restaurant.destroy_all
Review.destroy_all
10.times do
  resto = Restaurant.create({
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w(chinese italian japanese french belgian).sample
    # reviews: Faker::Restaurant.review
  })


  review = Review.create({
    content: Faker::Restaurant.review,
    rating: [0..5].sample
  })
  review.restaurant = resto
end

puts "Seeding completed."

