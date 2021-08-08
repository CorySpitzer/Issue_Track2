require 'rails_helper'

project23 = Project.create!(title: "Proj23",
            summary: "The 23nd project", 
            description: "Create a good project using Rails",
            status: "complete")

issue1 = Issue.create!(summary: "issue summary23",
            description: "description1",
            status: "Resolved",
            project_id: project23.id) 

RSpec.describe 'the projects page', type: :feature do 
    scenario 'click projects' do
        visit root_path
        click_on 'Projects'
        expect(page).to have_content 'The 23nd project'
        expect(page).to have_content 'issue summary23'
    end
end

RSpec.describe 'the new issue path', type: :feature do 
    scenario 'fill in new issue' do
        user1 = User.create!(username: "dev0",
        role: "developer",
        email: "d1@d.com",
        password: "GoHome4",
        password_confirmation: "GoHome4")
        
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: user1.email
        fill_in 'Password', with: user1.password
        click_on 'Log in'
        click_on 'Projects'
        click_on 'Proj23'
        select project23.title, :from => "title"
        fill_in 'summary', with: 'Test summary'
        fill_in 'description', with: 'Test description'
        fill_in 'status', with: 'Test status'
        click_on 'Save'
        expect(page).to have_content 'Test summary'
        expect(page).to have_content 'Test description'
        expect(page).to have_content 'Test status'
    end
end