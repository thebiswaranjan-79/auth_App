class DashboardController < ApplicationController
  before_action :require_login

  def index
    if current_user.receptionist?
      redirect_to patients_path
    elsif current_user.doctor?
      @patients_by_day = Patient.group("DATE(registered_at)").count
    end
  end
end
