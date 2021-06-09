class ApplicationController < ActionController::Base
    # All other controllers inherit from this controller so the 
    # methods below will all be available to the other controllers

    # credit https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8
    # all the way down to logged_in?
    helper_method :current_user # helper_method makes the method available to the view
    helper_method :logged_in?   # which is all views because we're in application controller
    def current_user
        User.find_by(id: session[:user_id])
    end
    def logged_in?
        !current_user.nil?  # is there a current user?
    end
end
