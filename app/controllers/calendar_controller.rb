class CalendarController < ApplicationController
  before_action :check_if_user_logged_in
  before_action :check_if_user_is_admin, only: [:teamCalendar, :teamEvents]

  def show
  end

  def teamEvents
    holidays = Holiday.select(:title, :start_date, :end_date).as_json
    users = []
    Admin.select(:user).where(admin: get_current_user[:email]).each { |oneUser| users.push(oneUser.user) }
    users.push(get_current_user[:email])
    approved_events = Event.select(:title, :start_date, :end_date, :is_approved, :email)
      .where(email: users, is_approved: true).as_json(is_team:true)
    unapproved_events = Event.select(:title, :start_date, :end_date, :is_approved, :email)
      .where(email: users, is_approved: false).as_json(is_team:true)
    events = approved_events + unapproved_events + holidays
    respond_to do |format|
      format.html
      format.json { render json: events.to_json }
    end
  end

  def teamCalendar
  end

  private

  def check_if_user_logged_in
    logged_in_user
  end

  def check_if_user_is_admin
    logged_in_admin
  end
end
