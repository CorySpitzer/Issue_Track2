require 'rails_helper'

project22 = Project.create!(title: "Proj22",
            summary: "The 22nd project", 
            description: "Create a good project using Rails",
            status: "complete")



issue1 = Issue.create!(summary: "issue summary22",
            description: "description1",
            status: "Resolved",
            project_id: project22.id) 

RSpec.describe 'the project manager dashboard', type: :feature do 

    scenario 'click on a project link' do
        # This needs to be in the scenario so it is rolled back in a transaction
        # Put project managers in the DB:
        user2 = User.create!(username: "PM22",
                            role: "project_manager",
                            email: "p1@d.com",
                            password: "GoHome4",
                            password_confirmation: "GoHome4")

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
        user2 = User.create!(username: "PM22",
                            role: "project_manager",
                            email: "p1@d.com",
                            password: "GoHome4",
                            password_confirmation: "GoHome4")

        # First log in the user
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: user2.email
        fill_in 'Password', with: user2.password
        click_on 'Log in'
        # Next, click on a project from the list
        click_on 'Delete project ' + project22.id.to_s
        expect(page).not_to have_content project22.title
    end
    scenario 'delete an issue' do
        user2 = User.create!(username: "PM22",
                            role: "project_manager",
                            email: "p1@d.com",
                            password: "GoHome4",
                            password_confirmation: "GoHome4")

        # First log in the user
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: user2.email
        fill_in 'Password', with: user2.password
        click_on 'Log in'
        # Next, click on a project from the list
        click_on 'Delete issue ' + issue1.id.to_s
        expect(page).not_to have_content issue1.summary
    end
    scenario 'click on a issue link' do
        user2 = User.create!(username: "PM22",
                            role: "project_manager",
                            email: "p1@d.com",
                            password: "GoHome4",
                            password_confirmation: "GoHome4")

        # First log in the user
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: user2.email
        fill_in 'Password', with: user2.password
        click_on 'Log in'
        # Next, click on a project from the list
        click_on issue1.summary
        expect(page).to have_content issue1.summary + ' Issue id: ' + issue1.id.to_s
    end
end