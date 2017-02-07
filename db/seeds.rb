# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

User.create!([
  {
    username: "johnnyazndoode",
    password: "johnny123hey",
    email: "johnnyazndoode@example.com"
  },
  {
    username: "tommygirlyboy",
    password: "dagirlyboy",
    email: "tommygirlyboy@example.com"
  },
  {
    username: "bindabomb",
    password: "bindabomb2na",
    email: "binbombingna123@example.com"
  }])

puts "You've created #{User.count} users!"
