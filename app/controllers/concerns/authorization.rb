module Authorization
  extend ActiveSupport::Concern

  included do
    before_filter :login_required
    helper_method :current_user, :logged_in?, :user_can_manage?, :user_can_admin?
  end
  
  def current_user
    if session[:user]
      @current_user ||= User.find(session[:user])
    elsif !cookies[:remember_token].nil?
      @current_user ||= User.find_by_remember_token!(cookies[:remember_token])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def login_required
    unless logged_in?
      store_location
      redirect_to login_url
    end
  end

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end

  def sign_out
    current_user.logout(cookies)
    current_user = nil
  end

  def session_create(user_id)
    session[:user] = user_id
  end

  def session_destroy
    session[:user] = nil
  end

  def redirect_back_or(default, *args)
    redirect_to(session[:return_to] || default, *args)
    session[:return_to] = nil
  end

  private

  def store_location
    session[:return_to] = request.url
  end

  def user_can_manage?
    current_user.role <= 1
  end

  def user_can_admin?
    current_user.role == 0
  end

end