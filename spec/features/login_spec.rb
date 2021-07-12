require 'rails_helper'

# TODO: DRY up some of the method calls

# Put a project manager in the DB:
user1 = User.create!(username: "PM0", 
            role: "project_manager",
            email: "e@e.com",
            password: "GoHome5",
            password_confirmation: "GoHome5")

# Put a developer in the DB:
user2 = User.create!(username: "dev0",
            role: "developer",
            email: "d@d.com",
            password: "GoHome4",
            password_confirmation: "GoHome4")

# Put an end user in the DB:
user3 = User.create!(username: "username1", 
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
        fill_in 'Email', with: user1.email
        fill_in 'Password', with: user1.password
        click_on 'Log in'
        expect(page).to have_content 'Project Manager Dashboard'
    end

    scenario 'valid inputs for a developer' do 
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: user2.email
        fill_in 'Password', with: user2.password
        click_on 'Log in'
        expect(page).to have_content 'Developer Dashboard'
    end

    scenario 'valid inputs for an end user' do 
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: user3.email
        fill_in 'Password', with: user3.password
        click_on 'Log in'
        expect(page).to have_content 'End user dashboard'
    end
end

RSpec.describe 'Logging in a developer', type: :feature do 

end