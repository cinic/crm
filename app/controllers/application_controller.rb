class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize
  helper_method :current_user, :logged_in?
  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorize
      store_location
      redirect_to login_url, alert: "Not authorized" if current_user.nil? && params[:controller] != "sessions"
    end

    def logged_in?
      current_user != nil
    end

    def store_location
      session[:return_to] = request.fullpath unless request.fullpath == '/login' || request.fullpath == '/sessions' || request.fullpath == '/logout'
    end
end
