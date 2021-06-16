class HomeController < ApplicationController
  def index
    @user = current_user
    # p @user
  end
end
