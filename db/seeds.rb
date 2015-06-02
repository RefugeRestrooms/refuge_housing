# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup
#
Post.destroy_all
puts "Destroyed all old Posts."

number_of_fake_posts = 15

number_of_fake_posts.times do |i|
  email = Faker::Internet.email

  Post.create!(
    title: Faker::Lorem.sentence,
    post_type: [:available, :needed].sample,
    street: Faker::Address.street_address,
    city: Faker::Address.city ,
    state: Faker::Address.state_abbr,
    country: "US",
    neighborhood: Faker::Address.city,
    description: Faker::Lorem.sentence,
    email: email,
    email_confirmation: email,
    expiration: Time.current.utc + 2.weeks,
    validation: "abc", #SecureRandom.hex,
    show: true
  )

  puts "Created #{(i+1).ordinalize} fake Post (out of #{number_of_fake_posts})."
end

puts "Done! :)"
