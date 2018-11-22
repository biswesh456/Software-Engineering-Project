class Pathologylabs::IndexController < ApplicationController
  layout 'pathologylab_layout'
  def index
    @pathologylab = Pathologylab.find(params[:id])
  end

  def profile
    @pathologylab = Pathologylab.find(params[:id])
    tests_provided = PathologyLabTest.where(pathologylab_id: @pathologylab.id)
    @test = @pathologylab.tests
  end

  def info
    @testid = params[:test_id]
    @pathologylab = (Pathologylab.find(params[:pathologylab_id]))
    @path_test = PathologyLabTest.find_by(test_id: @testid, pathologylab_id: @pathologylab.id)

    render json: {path_test: @path_test, pathlab: @pathologylab}
  end

  def current_appointment
    @path_test = PathologyLabTest.where(pathologylab_id: current_pathologylab.id)
    @appointments = []
    unless @path_test.nil? || @path_test.length == 0
      @path_test.each do |pt|
        a = Appointment.where(pathology_lab_test_id: pt.id)
        a.each do |ap|
          if ap.status == "Pending"
            @appointments.push(ap)
          end
        end
      end
    end
  end

  def history
    @path_test = PathologyLabTest.where(pathologylab_id: current_pathologylab.id)
    @appointments = []
    unless @path_test.nil? || @path_test.length == 0
      @path_test.each do |pt|
        a = Appointment.where(pathology_lab_test_id: pt.id)
        a.each do |ap|
          if ap.status != "Pending"
            @appointments.push(ap)
          end
        end
      end
    end
  end

  def edit_appointment
    @appointment = Appointment.find(params[:app_id])
  end

  def edit_appointment_after
    @appointment = Appointment.find(params[:app_id])
    @appointment.status = params[:status]
    @appointment.save
    redirect_to pathologylab_history_path()
  end

  def update_test
    @path_test = PathologyLabTest.where(pathologylab_id: current_pathologylab.id)
  end

  def get_fixed_time
    @path_test = PathologyLabTest.find_by(pathologylab_id: current_pathologylab.id, test_id: params[:test_id])
    @fixed_time = PathTestFixedTime.where(pathology_lab_test_id: @path_test.id)
    render json: @fixed_time
  end

  def delete_fixed_time
    puts("wertgyhujkjhgfdsasdfgsdfghjkjhwqwertyui")
    puts(params[:fixed_time_id])
  end
end
