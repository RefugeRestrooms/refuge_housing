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
    postal_code: Faker::Address.zip_code,
    country: "US",
    neighborhood: [Faker::Address.city, ""].sample,
    description: Faker::Lorem.sentence,
    email: email,
    email_confirmation: email,
    expiration: Time.current.utc + 2.weeks,
    validation: SecureRandom.hex,
    show: true
  )

  puts "Created #{(i + 1).ordinalize} fake Post (out of #{number_of_fake_posts})."
end

email = Faker::Internet.email
Post.create!(
  title: "Expired Post",
  post_type: :needed,
  street: Faker::Address.street_address,
  city: Faker::Address.city,
  state: Faker::Address.state_abbr,
  postal_code: Faker::Address.zip_code,
  country: "US",
  neighborhood: [Faker::Address.city, ""].sample,
  description: Faker::Lorem.sentence,
  email: email,
  email_confirmation: email,
  expiration: Time.current.utc - 1.week,
  validation: SecureRandom.hex,
  show: true
)
puts "Created expired  posts"

email = Faker::Internet.email
Post.create!(
  title: "Unconfirmed Post",
  post_type: :available,
  street: Faker::Address.street_address,
  city: Faker::Address.city,
  state: Faker::Address.state_abbr,
  postal_code: Faker::Address.zip_code,
  country: "US",
  neighborhood: [Faker::Address.city, ""].sample,
  description: Faker::Lorem.sentence,
  email: email,
  email_confirmation: email,
  expiration: Time.current.utc + 2.weeks,
  validation: SecureRandom.hex,
  show: false
)
puts "Created unconfirmed posts"

AdminUser.find_by_email("admin@example.com").destroy
AdminUser.create!(
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password"
)
puts "Created AdminUser (email: 'admin@example.com', password: 'password')"

puts "Done! :)"
# rubocop:enable Output
