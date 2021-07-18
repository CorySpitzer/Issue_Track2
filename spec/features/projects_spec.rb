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