require 'rails_helper'

project22 = Project.create!(title: "Proj22",
            summary: "The 22nd project", 
            description: "Create a good project using Rails",
            status: "complete")

# Put project managers in the DB:
user2 = User.create!(username: "PM22",
            role: "project_manager",
            email: "p1@d.com",
            password: "GoHome4",
            password_confirmation: "GoHome4")

RSpec.describe 'the project manager dashboard', type: :feature do 
    scenario 'click on a project link' do
        # First log in the user
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: user2.email
        fill_in 'Password', with: user2.password
        click_on 'Log in'
        # Next, click on a project from the list
        click_on project22.title
        expect(page).to have_content "Project: " + project22.title
    end
    scenario 'delete a project' do
        # First log in the user
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: user2.email
        fill_in 'Password', with: user2.password
        click_on 'Log in'
        # Next, click on a project from the list
        click_on 'Delete id ' + project22.id.to_s
        expect(page).not_to have_content project22.title
    end
end