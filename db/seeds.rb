# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# From: https://www.architecturaldigest.com/gallery/famous-houses-slideshow
house_attributes = [
  {
    name: "The Lake Palace Hotel",
    address: "Pichola, Udaipur, Rajasthan 313001, India",
  },
  {
    name: "Tai Fu Tai",
    address: "Castle Peak Road (San Tin), San Tin, Hong Kong",
  },
  {
    name: "Monticello",
    address: "931 Thomas Jefferson Pkwy, Charlottesville, VA 22902"
  },
]

if House.none?
  puts "Seeding database 'db/development.sqlite3'"
  House.create!(house_attributes)
end
