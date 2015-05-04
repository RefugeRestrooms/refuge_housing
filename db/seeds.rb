# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup
#

Post.create!(
  title: "VanNess1",
  post_type: :available,
  street: "1202 Van Ness Ave",
  city: "San Francisco",
  state: "California",
  country: "USA",
  neighborhood: "tenderloin",
  description: "text1",
  email: "foo1@bar.com",
  expiration: Time.current.utc + 2.weeks,
  validation: "72811119ec956862b5e91a02358cfc22",
  show: true
)

Post.create!(
  title: "Mission1",
  post_type: :available,
  street: "1201 Mission St.",
  city: "San Francisco",
  state: "California",
  country: "USA",
  neighborhood: "mission",
  description: "text2",
  email: "foo10@bar.com",
  expiration: Time.current.utc + 2.weeks,
  validation: "199315f84baa405ac309f3efd774138a",
  show: true
)

Post.create!(
  title: "VanNess2",
  post_type: :needed,
  street: "1200 Van Ness Ave",
  city: "San Francisco",
  state: "California",
  country: "USA",
  neighborhood: "tenderloin",
  description: "text3",
  email: "foo3@bar.com",
  expiration: Time.current.utc + 2.weeks,
  validation: "bd9484d18d699ecd1c3121cdcc50e773",
  show: true
)

Post.create!(
  title: "Berkeley1",
  post_type: :needed,
  street: "3350 Adeline St.",
  city: "Berkeley",
  state: "California",
  country: "USA",
  neighborhood: "South Berkeley",
  description: "text4",
  email: "foo4@bar.com",
  expiration: Time.current.utc + 2.weeks,
  validation: "7c745b58bd4e49d81f117ab738f451f4",
  show: true
)

Post.create!(
  title: "VanNess3",
  post_type: :available,
  street: "1203 Van Ness Ave",
  city: "San Francisco",
  state: "California",
  country: "USA",
  neighborhood: "tenderloin",
  description: "text1",
  email: "foo1@bar.com",
  expiration: Time.current.utc + 2.weeks,
  validation: "5693b84deeb80a1587e72efd9b621bca",
  show: true
)

Post.create!(
  title: "Embarcadero1",
  post_type: :available,
  street: "1 Embarcadero Center",
  city: "San Francisco",
  state: "California",
  country: "USA",
  neighborhood: "Financial District",
  description: "text1",
  email: "foo1@bar.com",
  expiration: Time.current.utc + 2.weeks,
  validation: "23654821a2aaa1a02cf566a09799216e",
  show: true
)

Post.create!(
  title: "Mission2",
  post_type: :available,
  street: "1000 Mission St",
  city: "San Francisco",
  state: "California",
  country: "USA",
  neighborhood: "mission",
  description: "text1",
  email: "foo1@bar.com",
  expiration: Time.current.utc + 2.weeks,
  validation: "9937c7619c7f376e622a61704ad834c4",
  show: true
)
