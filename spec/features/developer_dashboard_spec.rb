require 'rails_helper'




# Put a project in the DB: 
project1 = Project.create!(title: "Proj1",
            summary: "The 1st project", 
            description: "Create a good project using Rails",
            status: "complete")

# Put an issue in th DB:
issue1 = Issue.create!(summary: "issue summary1",
            description: "description1",
            status: "Resolved",
            project_id: project1.id) 

RSpec.describe 'the developer dashboard', type: :feature do 
    scenario 'click on a project link' do
        user2 = User.create!(username: "dev9",
                            role: "developer",
                            email: "d1@dev.com",
                            password: "GoHome4",
                            password_confirmation: "GoHome4")

        # First log in the user
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: user2.email
        fill_in 'Password', with: user2.password
        click_on 'Log in'
        # Next, click on a project from the list
        click_on project1.title
        expect(page).to have_content "Project: " + project1.title
    end

    scenario 'click on an issue link' do
        user1 = User.create!(username: "dev0",
                            role: "developer",
                            email: "d1@d.com",
                            password: "GoHome4",
                            password_confirmation: "GoHome4")
        # First log in the user
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: user1.email
        fill_in 'Password', with: user1.password
        click_on 'Log in'
        click_on issue1.summary
        expect(page).to have_content issue1.status
    end

    scenario 'assign a user to an issue' do
        user1 = User.create!(username: "dev0",
                            role: "developer",
                            email: "d1@d.com",
                            password: "GoHome4",
                            password_confirmation: "GoHome4")

        user2 = User.create!(username: "dev9",
                            role: "developer",
                            email: "d1@dev.com",
                            password: "GoHome4",
                            password_confirmation: "GoHome4")

        # First log in the user
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: user1.email
        fill_in 'Password', with: user1.password
        click_on 'Log in'
        select user2.username, :from => "username"
        select issue1.summary, :from => "summary"
        click_on 'Save'
        click_on 'Users'
        click_on user2.username
        expect(page).to have_content user2.username
        expect(page).to have_content issue1.summary 
    end
end