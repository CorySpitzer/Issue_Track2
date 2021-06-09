class UsersController < ApplicationController
  def new
  end

  def create
    
    # credit https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8
    @user = User.create(params.require(:user).permit(:username, :password))
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end
end
