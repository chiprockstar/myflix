# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.create(title: "Futrama", description: "Futurama.", small_cover_url: "/tmp/futurama.jpg" , large_cover_url: "/tmp/monk_large.jpg", category_id: 1)
Video.create(title: "South Park", description: "A bunch of funny dudes.", small_cover_url: "/tmp/south_park.jpg", large_cover_url: "/tmp/monk_large.jpg", category_id: 2)
Video.create(title: "Family Guy", description: "King of the Jungle.", small_cover_url: "/tmp/family_guy.jpg", large_cover_url: "/tmp/monk_large.jpg", category_id: 3)
Category.create(category: "TV Commedies")
Category.create(category: "TV Dramas")
Category.create(category: "Reality TV")
