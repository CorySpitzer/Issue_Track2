require 'rails_helper'
# require 'spec_helper'
require_relative '../lib/calculators'
require_relative '../app/models/project'

describe ProjectStatistics do
    it 'exists when created' do
        project = Project.create!(title: "Proj0",
                                summary: "The 0th project", 
                                description: "Create a good project using Rails",
                                status: "incomplete")
        proj_stats = ProjectStatistics.new(project.id) 
        expect(proj_stats).to be_an_instance_of(ProjectStatistics)
    end
end