class AdminController < ApplicationController
  before_action :check_if_user_is_admin

  def show
    @add_users = Admin.select(:user).where(admin: nil)
  end

  def addUser
    admin = Admin.find_by(user: params[:add_user])
    admin.update(admin: get_current_user[:email])
    flash[:success] = "User successfully added!"
    redirect_to "/admin"
  end

  def showEvents
    users = []
    Admin.select(:user).where(admin: get_current_user[:email]).each { |oneUser| users.push(oneUser.user) }
    @events_to_be_approved = Event.where(email: users, is_approved:false)
    puts @events_to_be_approved
  end

  def approveTimeOff
    event = Event.find_by(id:params[:event_id])
    event.update(is_approved:true)
    flash[:success] = "Time off Approved!"
    redirect_to "/approve"
  end

  private

  def check_if_user_is_admin
    logged_in_admin
  end
end
