class PasswordResetsController < ApplicationController
  skip_before_filter :login_required
  before_action :set_user, only: [:edit, :update]
  layout "application_password_resets"

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    # NB: this redirect is OK as we don't want to disclose that the user doesn't exist (if it doesn't)
    redirect_to dashboard_url, notice: "Email sent with password reset instructions."
  end

  def edit
  end

  def update

    # we should require the password to be present (unlike when editting user profile)
    unless params[:user][:password].present?
      @user.errors.add(:password, 'must be present')
      render :edit and return
    end

    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: "Password reset has expired."
    elsif @user.update_attribute(:password, user_params[:password])
      redirect_to dashboard_url, notice: "Password has been reset!"
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_password_reset_token!(params[:id])
    end

    def user_params
      params.require(:user).permit(:password)
    end
end

