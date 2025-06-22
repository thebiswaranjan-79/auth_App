class DashboardController < ApplicationController
  before_action :require_login

  def index
  if current_user.receptionist?
    redirect_to patients_path
  elsif current_user.doctor?
    @registered_count = Patient.where(user_id: current_user.id, status: "registered").count
    @completed_count  = Patient.where(user_id: current_user.id, status: "completed").count
  end
 end
end
