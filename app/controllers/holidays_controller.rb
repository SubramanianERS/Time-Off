class HolidaysController < ApplicationController
  before_action :check_if_user_logged_in
  def all
    holidays = Holiday.select(:title, :start_date, :end_date).as_json
    respond_to do |format|
      format.html
      format.json { render json:holidays.to_json }
    end
  end

  private 

  def check_if_user_logged_in
    logged_in_user
  end
end
