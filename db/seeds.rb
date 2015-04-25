# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name;g: 'Chicago' }, { title: 'Copenhagen' }])
#   Mayor.create(name;g: 'Emanuel', city: cities.first)
#

Post.create(name: 'Post 1', street: '1202 Van Ness Ave', city: 'San Francisco', state: 'CA', country: 'USA', neighborhood: 'tenderloin', description: 'text1', email: 'foo1@bar.com')
Post.create(name: 'Post 2', street: '1201 Van Ness Ave', city: 'San Francisco', state: 'CA', country: 'USA', neighborhood: 'mission', description: 'text2', email: 'foo2@bar.com')
Post.create(name: 'Post 3', street: '1200 Van Ness Ave', city: 'San Francisco', state: 'CA', country: 'USA', neighborhood: 'tenderloin', description: 'text3', email: 'foo3@bar.com')
Post.create(name: 'Post 4', street: '3350 Adeline St.', city: 'Berkeley', state: 'CA', country: 'USA', neighborhood: 'South Berkeley', description: 'text4', email: 'foo4@bar.com')

