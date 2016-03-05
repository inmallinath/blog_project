class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:email]
    user.send_password_email if user
    redirect_to root_url, notice: "E-mail with instructions to reset password has been sent to your registered email."
  end
end
