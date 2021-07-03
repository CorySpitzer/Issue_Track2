class AllProjectsController < ApplicationController
  def index
    @projects_count = Project.all.count

    issue_count = 0
    resolved_issues = 0
    Project.all.each do |project|
      # count the issues from all projects
      issue_count += project.issues.count
      project.issues.each do |issue|
        if issue.status.downcase == "resolved"
          resolved_issues += 1
        end
      end
    end
    @mean_issues_per_project = issue_count.to_f / @projects_count

    @proportion_of_resolved_issues_per_proj = resolved_issues.to_f / @projects_count
    
    # How many of each user type will we have? start at zero
    pm_count = 0
    dev_count = 0
    end_user_count = 0
    User.all.each do |user|
      if user.role.downcase == "project_manager"
        pm_count += 1
      elsif user.role.downcase == "developer"
        dev_count += 1
      else # user is just an end user
        end_user_count += 1
      end
    end
    @end_users_per_project = end_user_count.to_f / @projects_count
    @developers_per_project = dev_count.to_f / @projects_count
    @pms_per_project = pm_count.to_f / @projects_count
  end
end
