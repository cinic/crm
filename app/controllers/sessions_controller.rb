class SessionsController < ApplicationController
  layout "application_login"
  def new
  end

  def create
    user = User.where({email: params[:email]}).first
    
    if user && User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_back_or dashboard_url
    else
      redirect_to login_url, alert: "Неправильный email или пароль."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
end
