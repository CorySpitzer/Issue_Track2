class ProjectReportsController < ApplicationController
    require "calculators.rb"
    def index

        @project = Project.find(params[:format])

        # Generally we want computations to be put in a model,
        # but we have no model for project reports.
        # These instance variables are for project reports index.

        # @number_of_issues = 0
        # resolved_issues = 0
        # @project.issues.each do |issue|
        #     @number_of_issues += 1
        #     if issue.status.downcase! == "resolved"
        #         resolved_issues += 1
        #     end
        # end
        project_statistics = ProjectStatistics.new(params[:format])
        # p project_statistics.id
        
        @number_of_issues = project_statistics.count_issues
        p "number_of_issues:" + @number_of_issues.to_s 
        # The calculation must be made with a float to prevent rounding to the nearest integer.
        @percentage_of_resolved_issues = project_statistics.percentage_of_resolved_issues

        # count the number of comments for 
        # project_comments_count = 0
        # issue_count = 0
        # @project.issues.each do |issue|
        #     issue.comments.each do |comment|
        #         project_comments_count += 1
        #     end
        #     issue_count += 1
            # issue.users.each do |user|
        #     # end
        # end

        # Average comments per issue
        # @comments_per_issue = project_comments_count.to_f / @project.issues.count
        @comments_per_issue = project_statistics.mean_comments_per_issue

        # Number of issues
        @issue_count = @project.issues.count

        #number of comments
        @comment_count_per_project = project_statistics.comments_per_project

        # Check and count what role each user is
        # @PMs_involved, @devs_involved, @end_users_involved = 0, 0, 0

        # User.each do |user| 
        #     if user.role.downcase = "project manager"
        #         @PMs_involved += 1
        #     elsif user.role.downcase = "developer"
        #         @devs_involved += 1
        #     else #We then assume the user is an end user
        #         @end_users_involved += 1
        #     end
        # end
    end
end
