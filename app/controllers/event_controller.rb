class EventController < ApplicationController
  before_action :check_if_user_logged_in

  def create
    event_values = event_params
    event_values[:is_approved] = false
    event_values[:email] = get_current_user[:email]
    @event = Event.new(event_values)
    @event.save
    redirect_to "/calendar"
  end

  def all
    holidays = Holiday.select(:title, :start_date, :end_date).as_json
    email = get_current_user[:email]
    approved_events = Event.select(:title, :start_date, :end_date, :is_approved)
      .where(email: email, is_approved: true).as_json
    unapproved_events = Event.select(:title, :start_date, :end_date, :is_approved)
      .where(email: email, is_approved: false).as_json
    events = approved_events + unapproved_events + holidays
    respond_to do |format|
      format.html
      format.json { render json: events.to_json }
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date)
  end

  def check_if_user_logged_in
    logged_in_user
  end
end
