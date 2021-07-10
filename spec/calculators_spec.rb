require 'rails_helper'
# require 'spec_helper'
require_relative '../lib/calculators'
require_relative '../app/models/project'

project = Project.create!(title: "Proj0",
                                summary: "The 0th project", 
                                description: "Create a good project using Rails",
                                status: "incomplete")

proj_stats = ProjectStatistics.new(project.id)

issue = Issue.create!(summary: "issue summary3",
              description: "description4",
              status: "Resolved",
              project_id: project.id) 

describe ProjectStatistics do
    it 'exists when created' do 
        expect(proj_stats).to be_an_instance_of(ProjectStatistics)
    end

    it 'counts resolved issues' do
        expect(proj_stats.count_resolved_issues).to equal 1
    end
end