# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name;g: 'Chicago' }, { title: 'Copenhagen' }])
#   Mayor.create(name;g: 'Emanuel', city: cities.first)
#

Post.create(name: 'Post 1', street: '1202 Van Ness Ave', city: 'San Francisco', state: 'CA', country: 'USA', description: 'text1')
Post.create(name: 'Post 2', street: '1201 Van Ness Ave', city: 'San Francisco', state: 'CA', country: 'USA', description: 'text2')
Post.create(name: 'Post 3', street: '1200 Van Ness Ave', city: 'San Francisco', state: 'CA', country: 'USA', description: 'text3')
