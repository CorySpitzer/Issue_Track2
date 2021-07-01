# This file should contain all the record creation needed to seed the 
# database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or 
# created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Get rid off all the data that's aleady in the DB
Project.destroy_all
Issue.destroy_all
Comment.destroy_all
User.destroy_all

# We can run 'rails db:reset' (which runs 'rails db:seed' among other things)
# and it will work but running just 
# 'rails db:seed' will result in an error:
# ActiveRecord::InvalidForeignKey: SQLite3::ConstraintException: FOREIGN KEY constraint failed
# we need a variable here, project0, to call .id on and connect its Issue below
project0 = Project.create!(title: "Proj0",
                           summary: "The 0th project", 
                           description: "Create a good project using Rails",
                           status: "incomplete")

puts
puts "project0.id is"
puts project0.id
puts
issue0 = Issue.create!(summary: "issue summary0",
              description: "description0",
              status: "Unresolved",

              project_id: project0.id) 
              #This is the foreign key which connects this issue with project0

issue1 = Issue.create!(summary: "issue summary1",
              description: "description1",
              status: "Resolved",

              project_id: project0.id) 
# ------------------
project1 = Project.create!(title: "Proj1",
                           summary: "The 1st project", 
                           description: "Create a good project using Rails",
                           status: "complete")

puts
puts "project1.id is"
puts project1.id
puts

issue2 = Issue.create!(summary: "issue summary2",
              description: "description2",
              status: "Unresolved",

              project_id: project1.id) 

issue3 = Issue.create!(summary: "issue summary3",
              description: "description4",
              status: "Resolved",

              project_id: project1.id) 
# ------------------
# Create users linked to issues
# See http://joshfrankel.me/blog/create-a-many-to-many-activerecord-association-in-ruby-on-rails/
# create various variables so we can refer to their DB entries
# when creating new entries

# commenting this out/changing to user_x from user0 fixes: 
# ActiveRecord::RecordInvalid: Validation failed: Email can't be blank, Password can't be blank
user_x = issue2.users.create!(username: "username0", 
                             role: "end_user",
                             email: "a@a.com",
                             password: "GoHome1",
                             password_confirmation: "GoHome1")
user1 = issue2.users.create!(username: "username1", 
                             role: "end_user",
                             email: "b@b.com",
                             password: "GoHome2",
                             password_confirmation: "GoHome2")
user2 = issue2.users.create!(username: "username2", 
                             role: "end_user",
                             email: "c@c.com",
                             password: "GoHome3",
                             password_confirmation: "GoHome3")

# user0 = issue3.users.create!(username: "username0", role: "user")
# user1 = issue3.users.create!(username: "username1", role: "user")
# user2 = issue3.users.create!(username: "username2", role: "user")

developer0 = issue2.users.create!(username: "dev0",
                                  role: "developer",
                                  email: "d@d.com",
                                  password: "GoHome4",
                                  password_confirmation: "GoHome4")

project_manager0 = issue2.users.create!(username: "PM0", 
                                        role: "project_manager",
                                        email: "e@e.com",
                                        password: "GoHome5",
                                        password_confirmation: "GoHome5")

issue3.users.create!(username: "username1", 
                     role: "end_user",
                     email: "f@f.com",
                     password: "GoHome6",
                     password_confirmation: "GoHome6")

issue3.users.create!(username: "username2",
                     role: "end_user",
                     email: "g@g.com",
                     password: "GoHome7",
                     password_confirmation: "GoHome7")

developer1 = issue3.users.create!(username: "dev1",
                                  role: "developer",
                                  email: "h@h.com",
                                  password: "GoHome8",
                                  password_confirmation: "GoHome8")

issue3.users.create!(username: "PM0",
                     role: "project_manager",
                     email: "pm@pm.com",
                     password: "AllRoads1",
                     password_confirmation: "AllRoads1")
# puts issue2.users.'1'.username
# ------------------
# Create comments
comment0 = Comment.create!(content: "This is comment0",
                 issue_id: issue3.id,
                 user_id: user_x.id)
comment1 = Comment.create!(content: "This is comment1",
                 issue_id: issue3.id,
                 user_id: user1.id)
comment2 = Comment.create!(content: "This is comment2",
                 issue_id: issue2.id,
                 user_id: user_x.id)
comment3 = Comment.create!(content: "This is comment3",
                 issue_id: issue2.id,
                 user_id: user2.id)

# ------------------

# comment0 = Comment.create!(content: "This is a comment",

#                            issue_id: issue2.id)
 


# Project.create!([{
# # projects = Project.create!([{
# title: "Proj1",
#   summary: "The 1st project",
#   description: "Create a good project using Rails"
# },
# {
#   title: "The issue tracker",
#   summary: "A basic issue tracker",
#   description: "A basic issue tracker made with Ruby, Rails, and SQLite3"
  
# },
# {
#   title: "Take over the world",
#   summary: "A half-hearted attempt to take over the world",
#   description: "Take over the world using only Ruby, Rails, and SQLite3"
  
# }])

# Issue.create!([{
    # summary: "issue summary0",
    # description: "description0",
    # status: "Incomplete",
    # project_id: projects[0]
# },
# {
#     summary: "issue summary1",
#     description: "description1",
#     status: "Complete",
#     project_id: projects[0]
# }])