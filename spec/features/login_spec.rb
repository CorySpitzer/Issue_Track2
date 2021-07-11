require 'rails_helper'

# Put a project manager in the DB:
User.create!(username: "PM0", 
            role: "project_manager",
            email: "e@e.com",
            password: "GoHome5",
            password_confirmation: "GoHome5")

# Put a developer in the DB:
User.create!(username: "dev0",
            role: "developer",
            email: "d@d.com",
            password: "GoHome4",
            password_confirmation: "GoHome4")

# Put an end user in the DB:
User.create!(username: "username1", 
            role: "end_user",
            email: "f@f.com",
            password: "GoHome6",
            password_confirmation: "GoHome6")

RSpec.describe 'Logging in users', type: :feature do 
    scenario 'invalid inputs' do 
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'q@e.com'
        fill_in 'Password', with: 'GoHome5'
        click_on 'Log in'
        expect(page).to have_content 'Invalid Email or password'
    end

    scenario 'valid inputs for a project manager' do 
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'e@e.com'
        fill_in 'Password', with: 'GoHome5'
        click_on 'Log in'
        expect(page).to have_content 'Project Manager Dashboard'
    end

    scenario 'valid inputs for a developer' do 
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'd@d.com'
        fill_in 'Password', with: 'GoHome4'
        click_on 'Log in'
        expect(page).to have_content 'Developer Dashboard'
    end

    scenario 'valid inputs for an end user' do 
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'f@f.com'
        fill_in 'Password', with: 'GoHome6'
        click_on 'Log in'
        expect(page).to have_content 'End user dashboard'
    end
end

RSpec.describe 'Logging in a developer', type: :feature do 

end