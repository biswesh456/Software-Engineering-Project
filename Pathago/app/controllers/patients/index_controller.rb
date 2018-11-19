class Patients::IndexController < ApplicationController
  layout 'patient_layout'
  def index
    @patient = Patient.find(params[:id])
  end

  def profile
    @patient = Patient.find(params[:id])
  end

  def new_appointment
    @patient = Patient.find(params[:id])
  end
end
