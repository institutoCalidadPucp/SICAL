class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    p "AUTHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"
    if user
      p ap user
      p 'SIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII'
      session[:user_id] = user.id
      redirect_to dashboard_path, event: :authentication
    else
      p 'NO PERMITEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE'
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    p 'DESTRUIIIIIIIIIIIIIIII'
    session[:user_id] = nil
    redirect_to root_path
  end
end
