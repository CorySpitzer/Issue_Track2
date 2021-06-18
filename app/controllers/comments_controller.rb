class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    Comment.create!(issue_id: params[:issue_id], 
                    user_id: params[:user_id],
                    content: params[:content])
    redirect_back(fallback_location: comments_path)
  end
end
