class PatientsController < ApplicationController
  before_action :require_login
  before_action :require_receptionist, except: [:index, :show]

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
  @patient = current_user.patients.new(patient_params.merge(registered_at: Time.current, status: "registered"))
  if @patient.save
    redirect_to patients_path, notice: "Patient registered"
  else
    render :new
  end
end


  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to @patient, notice: "Patient updated"
    else
      render :edit
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_path, notice: "Patient deleted"
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :age, :disease)
  end
end
