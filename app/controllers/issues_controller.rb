class IssuesController < ApplicationController
  def index
    @issues = Issue.all
    # @issue = Issue.find(params[:id])
    # @comments = 
  end

  def show
    @issue = Issue.find(params[:id])
  end
end
