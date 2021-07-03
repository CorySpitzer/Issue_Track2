class IssuesController < ApplicationController
  # Authorize all actions for issue
  load_and_authorize_resource :issue

  # https://github.com/ryanb/cancan/issues/835#issuecomment-18663815
  def issue_params
    params.require(:issue).permit(:summary, :description, :status)
  end

  def index
    @issues = Issue.all
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def create
    # create issues and attach them to the project found by title
    Project.find_by_title(params[:title]).issues.create!(
                                          summary: params[:summary], 
                                          description: params[:description], 
                                          status: params[:status])
    redirect_to issues_url
  end

  def destroy
    @issue = Issue.find(params[:id])
    # first we must destroy any associated comments
    @issue.comments.each do |comment|
      comment.destroy
    end
    # Then we can destroy our isssue which no longer has comments
    @issue.destroy
    redirect_back fallback_location: '/'
  end
end
