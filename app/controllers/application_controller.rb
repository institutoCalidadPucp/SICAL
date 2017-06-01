class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_variables

   def after_sign_in_path_for(resources)
    root_path 
  end

  def after_sign_out_path_for(resources)
    new_user_session_path
  end

  def set_variables
    @controller = params[:controller]
    @action = params[:action]
  end
end
