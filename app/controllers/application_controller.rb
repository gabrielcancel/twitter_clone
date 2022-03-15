class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :name_tag, :desc, :location, :website, :birthdate, :avatar_url, :banner_url])
    end    
end
