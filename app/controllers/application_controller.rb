class ApplicationController < ActionController::Base
  include SessionsHelper
  include CalendarHelper
  before_action :store_previous_path

  def store_previous_path
    puts request.path
    puts "hello"
    session[:previous_path] ||= []
    session[:previous_path] << request.referer
    session[:previous_path].shift while session[:previous_path].count > 5
  end
end
