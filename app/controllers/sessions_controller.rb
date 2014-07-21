class SessionsController < ApplicationController
  layout "application_login"
  def new
  end

  def create
    user = User.where({email: params[:email]}).first
    
    if user && User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_back_or dashboard_url, notice: "Logged in!"
    else
      flash.now.alert = "Неправильный email или пароль."
      render 'new'
      #redirect_to admin_login_url, alert: "Email or password is invalid"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Logged out!"
  end
  def redirect_back_or(default, notice)
    redirect_to(session[:return_to] || default, notice: notice)
    session.delete(:return_to)
  end
end
