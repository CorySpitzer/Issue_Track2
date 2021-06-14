class ProjectReportsController < ApplicationController
    def index
        @project = Project.find(params[:format])
        # Generally we want computations to be put in a model,
        # but we have no model for project reports
        @number_of_issues = 0
        @project.issues.each do |issue|
            @number_of_issues += 1
        end

    end
end
