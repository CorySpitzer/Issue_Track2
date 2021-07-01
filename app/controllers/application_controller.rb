class ApplicationController < ActionController::Base
    # all this is to allow the dropdown menu in registration:
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    # https://github.com/ryanb/cancan/issues/835#issuecomment-18663815
    before_action do
        resource = controller_name.singularize.to_sym
        method = "#{resource}_params"
        params[resource] &&= send(method) if respond_to?(method, true)
      end

    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
            devise_parameter_sanitizer.permit(:account_update, keys: [:role])
        end
end
