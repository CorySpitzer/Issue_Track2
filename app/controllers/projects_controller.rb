class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    # We can't delete the project without deleting it's children and their children
    # First delete the grandkids, comments
    @project.issues.each do |issue|
      issue.comments.each do |comment|
        comment.destroy
      end
    end
    # then delete the kids,issues
    @project.issues.each do|issue|
      issue.destroy
    end
    @project.destroy
    redirect_back fallback_location: '/'
  end

  def create 
    project = Project.create!(title: params[:title],
    summary: params[:summary], 
    description: params[:description],
    status: params[:status])
    redirect_to projects_path(project)
  end
end
