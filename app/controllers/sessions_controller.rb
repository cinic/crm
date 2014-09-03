class SessionsController < ApplicationController
  skip_before_filter :login_required, only: [:new, :create]
  layout "application_login"

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      sign_in user if params[:remember_me]
      session_create user.id
      
      redirect_back_or dashboard_url, notice: "Удачный вход."
    else
      flash.now.alert = "Неправильный email или пароль. Возможно вы регистрировались на другой email?"
      render 'new'
    end
  end

  def destroy
    sign_out
    session_destroy

    redirect_to dashboard_url, notice: "Вы вышли из системы."
  end
end
