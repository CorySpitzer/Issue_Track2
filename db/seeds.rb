# This file should contain all the record creation needed to seed the 
# database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or 
# created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Project.destroy_all
Issue.destroy_all
Comment.destroy_all
User.destroy_all

Project.create!([{
  title: "Proj1",
  summary: "The 1st project",
  description: "Create a good project using Rails"
},
{
  title: "The issue tracker",
  summary: "A basic issue tracker",
  description: "A basic issue tracker made with Ruby, Rails, and SQLite3"
  
},
{
  title: "Take over the world",
  summary: "A half-hearted attempt to take over the world",
  description: "Take over the world using only Ruby, Rails, and SQLite3"
  
}])