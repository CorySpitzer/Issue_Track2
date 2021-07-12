require 'rails_helper'

# Create a project
project10 = Project.create!(title: "Proj10",
                           summary: "The 1st project", 
                           description: "Create a good project using Rails",
                           status: "complete")

# Give that project an issue    
issue20 = Issue.create!(summary: "issue summary20",
                           description: "description2",
                           status: "Unresolved",
             
                           project_id: project10.id) 

# Put an end user in the DB connected with the issue:
user1 = issue20.users.create!(username: "eu0",
            role: "end_user",
            email: "eu@d.com",
            password: "GoHome4",
            password_confirmation: "GoHome4")

RSpec.describe 'the developer dashboard', type: :feature do 
    scenario 'click on a project link' do
        # First log in the user
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: user1.email
        fill_in 'Password', with: user1.password
        click_on 'Log in'
        expect(page).to have_content issue20.summary
    end
end