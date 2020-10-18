module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def get_current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !get_current_user.nil?
  end

  def logged_in_admin?
    get_current_user[:is_admin]
    logged_in? && get_current_user[:is_admin]
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in to continue."
      redirect_to login_url
    end
  end

  def logged_in_admin
    unless logged_in_admin?
      flash[:danger] = "Please log in with Admin Priviliges to continue."
      session[:previous_path].pop
      redirect_back fallback_location: session[:previous_path].pop
    end
  end
end
