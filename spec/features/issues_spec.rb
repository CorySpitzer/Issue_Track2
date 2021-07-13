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

RSpec.describe 'the issues page', type: :feature do 
    scenario 'click on issues in the nav' do
        # No need to log in the user
        visit root_path
        click_on 'Issues'
        expect(page).to have_content 'Summary: Xissue summary1'
    end
end