class HolidaysController < ApplicationController
  def all
    holidays = Holiday.select(:title, :start_date, :end_date).as_json
    respond_to do |format|
      format.html
      format.json { render json:holidays.to_json }
    end
  end
end
