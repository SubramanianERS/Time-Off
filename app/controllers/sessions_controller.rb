class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    puts user.password_digest
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to "/calendar"
    else
      flash.now[:danger] = "Invalid credentials"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
