# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Uncomment the bellow next 2 line to seed from the lib/seed/organizations.csv
Organization.destroy_all            #  useful when you do a reseed it deletes all preexisting  data
require_relative './organization_seeding.rb'

User.destroy_all

user1 = User.create!(email: "user1@user.com", password: "password", password_confirmation: "password")
user2 = User.create!(email: "user2@user.com", password: "password", password_confirmation: "password")

puts "Created #{User.count} Users: #{user1.email} and #{user2.email}" 
