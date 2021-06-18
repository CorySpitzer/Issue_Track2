class IssuesController < ApplicationController
  def index
    @issues = Issue.all
    # @issue = Issue.find(params[:id])
    @comment_content = []
    @issues.each do |issue|
      issue.comments.each do |comment|
        if comment.content != nil
          @comment_content << comment.content
        end
      end
    end

  end

  def show
    @issue = Issue.find(params[:id])
  end

  def create
    @issue = Issue.new(params[:issue])
    redirect_to issues_url
  end
end
