class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create

    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      # sign_in(user)
      # ADDED the BELOW CODE FOR AUTH TOKEN - REMEMBER ME FUNCTIONALITY
      if params[:remember_me]
        sign_in_token(user)
      else
        cookies[:auth_token] = user.auth_token
      end
      # END OF CODE
      redirect_to posts_path, notice: "Signed in!"
    else
      flash.now[:alert] = "Wrong Credentials!"
      render :new
    end
  end

  def destroy
    # session[:user_id] = nil
    cookies.delete(:auth_token) # ADDED THIS LINE OF CODE FOR AUTH TOKEN - REMEMBER ME FUNCTIONALITY
    redirect_to root_path, notice: "Signed out"
  end
end
