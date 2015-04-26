# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup
#

Post.create(
  title: "VanNess1",
  street: "1202 Van Ness Ave",
  city: "San Francisco",
  state: "CA",
  country: "USA",
  neighborhood: "tenderloin",
  description: "text1",
  email: "foo1@bar.com",
  expiration: Time.current.utc.iso8601 + (2 * 7 * 24 * 60 * 60),
  validation: "72811119ec956862b5e91a02358cfc22",
  show: true
)

Post.create(
  title: "Mission1",
  street: "1201 Mission St.",
  city: "San Francisco",
  state: "CA",
  country: "USA",
  neighborhood: "mission",
  description: "text2",
  email: "foo10@bar.com",
  expiration: Time.current.utc.iso8601 + (2 * 7 * 24 * 60 * 60),
  validation: "199315f84baa405ac309f3efd774138a",
  show: true
)

Post.create(
  title: "VanNess2",
  street: "1200 Van Ness Ave",
  city: "San Francisco",
  state: "CA",
  country: "USA",
  neighborhood: "tenderloin",
  description: "text3",
  email: "foo3@bar.com",
  expiration: Time.current.utc.iso8601 + (2 * 7 * 24 * 60 * 60),
  validation: "bd9484d18d699ecd1c3121cdcc50e773",
  show: false
)

Post.create(
  title: "Berkeley1",
  street: "3350 Adeline St.",
  city: "Berkeley",
  state: "CA",
  country: "USA",
  neighborhood: "South Berkeley",
  description: "text4",
  email: "foo4@bar.com",
  expiration: Time.current.utc.iso8601 - 1,
  validation: "7c745b58bd4e49d81f117ab738f451f4",
  show: true
)
