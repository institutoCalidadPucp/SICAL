class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   def after_sign_in_path_for(resources)
    root_path 
  end

  def after_sign_out_path_for(resources)
    new_user_session_path
  end
end
