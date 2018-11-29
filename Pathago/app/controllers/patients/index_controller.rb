require 'date'
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
    time_final = DateTime.strptime(@date+ " " + @time + ":00", '%Y-%m-%d %H:%M:%S')
    Appointment.create(status: "Pending", pathology_lab_test_id: params[:path_test_id], patient_id: current_patient.id, appointment_date: @date, appointment_time: time_final)
    new_testpathtime = TestPathTime.find_by(pathology_lab_test_id: params[:path_test_id], time: time_final)
    if new_testpathtime.nil?
      TestPathTime.create(pathology_lab_test_id: params[:path_test_id], time: time_final, occupied_seats:1)
    else
      new_testpathtime.occupied_seats=new_testpathtime.occupied_seats+1
      new_testpathtime.save
    end
  end

  def pay
    @pathology_lab_test = PathologyLabTest.find(params[:path_test_id])
    @date = params[:date]
    @time = params[:time]
  end

  def view_appointment
      @appointment = Appointment.find(params[:app_id])
  end
end
