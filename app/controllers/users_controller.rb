class UsersController < ApplicationController
  def signUp
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    puts @user
    if @user.save
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
