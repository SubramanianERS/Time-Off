class UsersController < ApplicationController

  def signUp
    @user = User.new
  end

  def create
    @admin = Admin.new(user: params[:user][:email])
    @user = User.new(user_params)
    if @user.save && @admin.save
      log_in @user
      redirect_to "/calendar"
    else
      render "signUp"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :employee_id)
  end
end
