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
    @pathology_lab_test = PathologyLabTest.find(params[:path_test_id])
    @test = @pathology_lab_test.test
    @pathologylab = @pathology_lab_test.pathologylab
  end

  def confirmation
    @pathology_lab_test = PathologyLabTest.find(params[:path_test_id])
    @test = @pathology_lab_test.test
    @pathologylab = @pathology_lab_test.pathologylab
    @cost = @pathology_lab_test.cost
    @date = params[:date]
    @time = params[:time]
    Appointment.create(status: "Pending", pathology_lab_test_id: params[:path_test_id], patient_id: current_patient.id, appointment_date: @date, appointment_time: @time)
  end

  def pay
    @pathology_lab_test = PathologyLabTest.find(params[:path_test_id])
    @date = params[:date]
    @time = params[:time]
  end
end
