require 'rails_helper'
# require 'spec_helper'
require_relative '../lib/calculators'
require_relative '../app/models/project'



# Setup the objects for testing:
project = Project.create!(title: "Proj0",
                                summary: "The 0th project", 
                                description: "Create a good project using Rails",
                                status: "incomplete")

proj_stats = ProjectStatistics.new(project.id)

issue = Issue.create!(summary: "issue summary3",
              description: "description4",
              status: "Resolved",
              project_id: project.id) 

# user = issue.users.create!(username: "dev1",
#               role: "developer",
#               email: "9@cory.com",
#               password: "GoHome8",
#               password_confirmation: "GoHome8")

comment0 = Comment.create!(content: "This is comment0",
              issue_id: issue.id,
              user_id: user.id)
comment1 = Comment.create!(content: "This is comment1",
              issue_id: issue.id,
              user_id: user.id)

describe ProjectStatistics do
    it 'exists when created' do 
        expect(proj_stats).to be_an_instance_of(ProjectStatistics)
    end

    it 'counts resolved issues' do
        expect(proj_stats.count_resolved_issues).to equal 1
    end

    it 'counts comments for a given project' do 
        expect(proj_stats.comments_per_project).to equal 2
    end
end