require 'rails_helper'

# Put a project manager in the DB:
project_manager0 = User.create!(username: "PM0", 
                                role: "project_manager",
                                email: "e@e.com",
                                password: "GoHome5",
                                password_confirmation: "GoHome5")


RSpec.describe 'Logging in a project manager', type: :feature do 
    scenario 'invalid inputs' do 
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'q@e.com'
        fill_in 'Password', with: 'GoHome5'
        click_on 'Log in'
        expect(page).to have_content 'Invalid Email or password'
    end
    scenario 'valid inputs' do 
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'e@e.com'
        fill_in 'Password', with: 'GoHome5'
        click_on 'Log in'
        expect(page).to have_content 'Project Manager Dashboard'
    end
end