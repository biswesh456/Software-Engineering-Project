class Patients::IndexController < ApplicationController
  layout 'patient_layout'
  def index
    @patient = Patient.find(params[:id])
  end
  def show
    @appointments = Appointment.where(patient_id: current_patient.id)
  end
  def profile
    @patient = Patient.find(params[:id])
  end

  def new_appointment
    @patient = Patient.find(params[:id])
  end

  def book_appointment
    @pathology_lab_test = PathologyLabTest.find(params[:id])
    @test = @pathology_lab_test.test
    @pathologylab = @pathology_lab_test.pathologylab
  end
end
