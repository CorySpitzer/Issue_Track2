class AllProjectsController < ApplicationController
  def index
    @number_of_projects = Project.all.count

    issue_count = 0
    Project.all.each do |project|
      issue_count += project.issues.count
    end
    @mean_issues_per_project = issue_count.to_f / @number_of_projects
  end
end
