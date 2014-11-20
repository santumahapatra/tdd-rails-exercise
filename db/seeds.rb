# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Tickets.create!(from: "Bangalore", to: "Delhi", date: (Time.now + 864000))
Tickets.create!(from: "Bangalore", to: "Chennai", date: (Time.now + 864000))
Tickets.create!(from: "Bangalore", to: "Kolkata", date: (Time.now + 864000))
Tickets.create!(from: "Bangalore", to: "Mumbai", date: (Time.now + 864000))
Tickets.create!(from: "Kolkata", to: "Bangalore", date: (Time.now + 864000))
Tickets.create!(from: "Jaipur", to: "Bangalore", date: (Time.now + 864000))