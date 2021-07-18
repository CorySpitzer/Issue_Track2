require 'rails_helper'

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

        # visit the users page, which is only available to a PM
        visit users_path 
        expect(page).to have_content user2.username
    end
end