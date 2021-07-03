class CommentsController < ApplicationController
  load_and_authorize_resource :comment
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    # creat a new comment with info from the params hash
    Comment.create!(issue_id: params[:issue_id], 
                    user_id: params[:user_id],
                    content: params[:content])
    # Go to the comments index if something goes wrong
    redirect_back(fallback_location: comments_path)
  end
end
