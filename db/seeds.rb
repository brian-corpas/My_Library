# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all

puts "Creating categories..."

Category.create(name: "Romance")
Category.create(name: "História")
Category.create(name: "Técnico")
Category.create(name: "Didáctico")
Category.create(name: "Viagem")
Category.create(name: "Ficção Científica")

puts "Finish"