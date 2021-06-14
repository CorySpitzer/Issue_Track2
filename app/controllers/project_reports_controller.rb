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
        @proportion_of_resolved_issues = resolved_issues.to_f / @number_of_issues



    end
end
