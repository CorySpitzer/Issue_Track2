class HomeController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    # p @user
  end

  def create
    # Here we must associate a user with a issue through the
    # join table by adding the user id and issue id to it
    # user = User.find(params[:user_id])
    # issue = Issue.find(params[:issue.id])
    if User.ids.include?(params[:user_id].to_i) and Issue.ids.include?(params[:issue_id].to_i)
      User.find(params[:user_id]).issues << Issue.find(params[:issue_id])
    else
      
    end
    redirect_back(fallback_location: root_path)
  end
end
