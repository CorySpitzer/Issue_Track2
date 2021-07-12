require 'rails_helper'

# Put a developer in the DB:
User.create!(username: "dev0",
            role: "developer",
            email: "d1@d.com",
            password: "GoHome4",
            password_confirmation: "GoHome4")

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
        # First log in the user
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'd1@d.com'
        fill_in 'Password', with: 'GoHome4'
        click_on 'Log in'
        # Next, click on a project from the list
        click_on project1.title
        expect(page).to have_content "Project: " + project1.title
    end

    scenario 'click on an issue link' do
        # First log in the user
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'd1@d.com'
        fill_in 'Password', with: 'GoHome4'
        click_on 'Log in'
        click_on issue1.summary
        expect(page).to have_content issue1.status
    end
end