class ProjectsController < ApplicationController
  load_and_authorize_resource :project

  # https://github.com/ryanb/cancan/issues/835#issuecomment-18663815
  def project_params
    params.require(:project).permit(:summary, :description, :title)
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    # We can't delete the project without deleting it's children and their children
    # First delete the grandkids: comments
    @project.issues.each do |issue|
      issue.comments.each do |comment|
        comment.destroy
      end
    end
    # then delete the kids: issues
    @project.issues.each do|issue|
      issue.destroy
    end
    @project.destroy
    redirect_back fallback_location: '/'
  end

  def create 
    project = Project.create!(title: params[:project][:title],
    summary: params[:project][:summary], 
    description: params[:project][:description],
    status: params[:project][:status])
    redirect_to projects_path(project)
  end
end
