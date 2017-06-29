class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_variables
  helper_method :current_user
  
   def after_sign_in_path_for(resources)
    root_path 
  end

  def after_sign_out_path_for(resources)
    new_user_session_path
  end

  def set_variables
    begin
      @user_menus = current_user.permit_tabs
      @controller = params[:controller]
      @action = params[:action]
    rescue
      p '************* LOG OUT ***************'
    end
  end
end
