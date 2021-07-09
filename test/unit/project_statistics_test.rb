require "test_helper"
require "calculators"

class ProjectStatisticsTest < ActiveSupport::TestCase
    test "project statistics can be made" do
        proj = Project.create!(title: "Proj0",
                            summary: "The 0th project", 
                            description: "Create a good project using Rails",
                            status: "incomplete")
        proj_stats = ProjectStatistics.new proj.id
        assert_instance_of(ProjectStatistics, proj_stats)
    end

    test "count resolved issues" do
        proj = Project.create!(title: "Proj0",
                            summary: "The 0th project", 
                            description: "Create a good project using Rails",
                            status: "incomplete")
        issue0 = Issue.create!(summary: "issue summary0",
                            description: "description0",
                            status: "resolved",
                            project_id: proj.id) 
        proj_stats = ProjectStatistics.new proj.id
        # p proj_stats.count_resolved_issues
        resolved_issues = proj_stats.count_resolved_issues
        assert_equal(1, resolved_issues)
    end
end