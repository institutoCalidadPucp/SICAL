class SessionGoogleController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    p "AUTHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"
    if user
      p ap user
      p 'SIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII'
      session[:user_id] = user.id
      redirect_to dash_path, event: :authentication
    else
      p 'NO PERMITEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE'
      redirect_to root_path, event: :unauthentication
    end
  end

  def destroy
    reset_session
    p 'DESTRUIIIIIIIIIIIIIIII'
    session[:user_id] = nil
    redirect_to root_path
end
end
