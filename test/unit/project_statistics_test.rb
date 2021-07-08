require "test_helper"
require "calculators"

class ProjectStatisticsTest < ActiveSupport::TestCase
    test "" do
        proj = Project.create!(title: "Proj0",
                            summary: "The 0th project", 
                            description: "Create a good project using Rails",
                            status: "incomplete")
        proj_stats = ProjectStatistics.new proj.id
    end
end