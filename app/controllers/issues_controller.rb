class IssuesController < ApplicationController
  def index
    @issues = Issue.all
    # @issue = Issue.find(params[:id])
    # @comment_content = {}
    # @issues.each do |issue|
    #   issue.comments.each do |comment|
    #     if comment.content != nil

    #       # @comment_content[issue.id] = comment.content
    #     end
    #   end
    # end
    # @comments
    # @comment_content = []
    # @issues.each do |issue|
    #   issue.comments.each do |comment|
    #     if comment.content != nil
    #       @comment_content << comment.content
    #     end
    #   end
    # end
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def create
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
