class UsersController < ApplicationController
  before_action :find_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def edit
  end

  def update
    user_params = params.require(:user).permit(:first_name, :last_name, :email)
    # @user.assign_attributes user_params
    # if @user.save(validate: false)
    if @user.update_attributes user_params
      redirect_to(root_path, {notice: "User updated!"})
    else
      render :edit
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_path, notice: "User Created!"
    else
      flash.now[:alert] = "User was not created"
      render :new
    end
  end

  def update_password
    if valid_pass?
      if @user.update user_params
        redirect_to(root_path, {notice: "Password updated!"})
      else
        render :edit_password
      end
    else
      render :edit_password
    end
  end

  def edit_password
  end

  private

  def find_user
    @user = User.find params[:id]
  end

  def valid_pass?
    check_password = @user.authenticate(params[:user][:current_password])
    if (params[:user][:current_password] != params[:user][:password]) && check_password
      true
    else
      flash.now[:alert] = "Invalid password combination"
      false
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
