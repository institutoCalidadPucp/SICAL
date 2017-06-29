class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user
      p 'SIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII'
      session[:user_id] = user.id
      sign_in_and_redirect root_path, event: :authentication
    else
      p 'NO PERMITEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE'
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
