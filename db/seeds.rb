# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup
#

# rubocop:disable Output
Post.destroy_all
puts "Destroyed all old Posts."

number_of_fake_posts = 15

number_of_fake_posts.times do |i|
  email = Faker::Internet.email

  Post.create!(
    title: Faker::Lorem.sentence,
    post_type: [:available, :needed].sample,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    country: "US",
    neighborhood: [Faker::Address.city, ""].sample,
    description: Faker::Lorem.sentence,
    email: email,
    email_confirmation: email,
    expiration: Time.current.utc + 2.weeks,
    validation: "abc", # SecureRandom.hex,
    show: true
  )

  puts "Created #{(i + 1).ordinalize} fake Post (out of #{number_of_fake_posts})."
end

puts "Creating expired and unconfirmed post"

Post.create!(
  title: "Expired Post",
  post_type: :needed,
  street: "3350 Adeline St.",
  city: "Berkeley",
  state: "CA",
  country: "US",
  neighborhood: "South Berkeley",
  description: "text4",
  email: "foo4@bar.com",
  email_confirmation: "foo4@bar.com",
  expiration: Time.current.utc + 1.weeks,
  validation: "7c745b58bd4e49d81f117ab738f451f4",
  show: true
)

Post.create!(
  title: "Unconfirmed Post",
  post_type: :available,
  street: "1001 Mission St",
  city: "San Francisco",
  state: "CA",
  country: "US",
  neighborhood: "mission",
  description: "text1",
  email: "foo1@bar.com",
  email_confirmation: "foo1@bar.com",
  expiration: Time.current.utc + 2.weeks,
  validation: "9937c7619c7f376e622a61704ad834c5"
)

puts "Done! :)"

# rubocop:enable Output
