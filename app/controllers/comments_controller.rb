class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  
  def create
    # params.permit(:id)
    # p "params", params
    Comment.create!(issue_id: params[:id], 
                    user_id: User.find_by_username(params[:username]).id,
                    content: params[:content])
      a          
    redirect_back(fallback_location: comments_path)
  end
end
