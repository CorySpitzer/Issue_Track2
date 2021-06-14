class ProjectReportsController < ApplicationController
    def index
        @project = Project.find(params[:format])

        # Generally we want computations to be put in a model,
        # but we have no model for project reports.
        # These instance variables are for project reports index.
        @number_of_issues = 0
        resolved_issues = 0
        @project.issues.each do |issue|
            @number_of_issues += 1
            if issue.status.downcase! == "resolved"
                resolved_issues += 1
            end
        end
        # The calculation must be made with a float to prevent rounding to the nearest integer.
        @percentage_of_resolved_issues = 100 * resolved_issues.to_f / @number_of_issues

        # count the number of comments for 
        project_comments_count = 0
        issue_count = 0
        @project.issues.each do |issue|
            issue.comments.each do |comment|
                project_comments_count += 1
            end
            issue_count += 1
            # issue.users.each do |user|

            # end
        end
        @comments_per_issue = (project_comments_count.to_f / issue_count)
        p "(project_comments_count.to_f / issue_count)"
        p (project_comments_count.to_f / issue_count)
        p "project_comments_count:" + project_comments_count.to_s
        p "issue_count: " + issue_count.to_s
        # @comments_per_user = (@project.comments.count.to_f / User.count).round(2)

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
