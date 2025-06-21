class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to login_path unless current_user
  end

  def require_receptionist
    redirect_to dashboard_path unless current_user&.receptionist?
  end

  def require_doctor
    redirect_to dashboard_path unless current_user&.doctor?
  end
end
