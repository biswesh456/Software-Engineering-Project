class AppointmentsController < ApplicationController
  def new

  end
  def show
     @appointments = Appointment.where(patient_id: current_patient.id) 
  end
end
