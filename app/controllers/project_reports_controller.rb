class ProjectReportsController < ApplicationController
    require "calculators.rb"
    def index

        @project = Project.find(params[:format])

        # Generally we want computations to be put in a model,
        # but we have no model for project reports.
        # These instance variables are for project reports index.

        project_statistics = ProjectStatistics.new(params[:format])
        # p project_statistics.id
        
        @number_of_issues = project_statistics.count_issues
        # p "number_of_issues:" + @number_of_issues.to_s 
        # The calculation must be made with a float to prevent rounding to the nearest integer.
        @percentage_of_resolved_issues = project_statistics.percentage_of_resolved_issues
        if @percentage_of_resolved_issues.to_f.nan?
            @percentage_of_resolved_issues = 0
        end

        # Average comments per issue
        # @comments_per_issue = project_comments_count.to_f / @project.issues.count
        @comments_per_issue = project_statistics.mean_comments_per_issue
        if @comments_per_issue.to_f.nan?
            @comments_per_issue = 0
        end

        # Number of issues
        @issue_count = @project.issues.count

        #number of comments
        @comment_count_per_project = project_statistics.comments_per_project

        # Check and count what role each user is
        # @PMs_involved, @devs_involved, @end_users_involved = 0, 0, 0
    end
end
