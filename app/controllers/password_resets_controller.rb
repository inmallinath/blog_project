class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:email]
    user.send_password_email if user
    redirect_to root_url, notice: "E-mail with instructions to reset password has been sent to your registered email."
  end

  def edit
    @user = User.find_by_password_reset_token! params[:id]
  end

  def update
    @user = User.find_by_password_reset_token! params[:id]
    if @user.password_reset_sent_at < 3.days.ago
      redirect_to new_password_reset_path, alert: "Password reset has already expired!"
    elsif @user.update_attributes user_params
      redirect_to root_url, notice: "Password has been reset!"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
