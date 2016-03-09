class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_signed_in?
    # session[:user_id].present?
    # ADDED the BELOW CODE FOR AUTH TOKEN - REMEMBER ME FUNCTIONALITY
    cookies[:auth_token].present?
    # END OF CODE
  end
  helper_method :user_signed_in?

  def current_user
    # @current_user ||= User.find_by_id(session[:user_id])
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_in_token(user)
    cookies.permanent[:auth_token] = user.auth_token
  end

  def authenticate_user
    # twitter_user = User.find_by_uid params[:uid]
    # byebug
    redirect_to new_session_path, notice: "Please sign in!" unless user_signed_in?
  end
end
