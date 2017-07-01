class SessionGoogleController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    p 'HOLAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
    if user
      p 'ENRREEEEEEEEEEEEEEEEEEEEs'
      session[:user_id] = user.id
      redirect_to dash_path, event: :authentication
    else
      redirect_to root_path, event: :unauthentication
    end
  end

  def destroy
    reset_session
    session[:user_id] = nil
    redirect_to root_path
end
end
