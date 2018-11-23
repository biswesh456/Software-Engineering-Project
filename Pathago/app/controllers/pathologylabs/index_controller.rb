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
    @list = ["00:00", '00:30', "01:00", "01:30", "02:00", "02:30", "03:00", "03:30", "04:00", "04:30", "05:00", "05:30", "06:00", "06:30", "07:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30", "20:00", "20:30", "21:00", "21:30", "22:00", "22:30", "23:00", "23:30"]
    @fixed_time.each do |ft|
      hours = ft.time.strftime("%H")
      minutes = ft.time.strftime("%M")
      @list.delete(hours+":"+minutes)
    end
    render json: {fixed_time: @fixed_time, lst:@list, path_test:@path_test}
  end

  def delete_fixed_time
    (PathTestFixedTime.find(params[:fixed_time_id])).destroy
    redirect_to pathologylab_update_test_path()
  end

  def add_fixed_time
    plt = PathologyLabTest.find_by(test_id: params[:test_id], pathologylab_id:current_pathologylab.id).id
    PathTestFixedTime.create(pathology_lab_test_id: plt, time: DateTime.strptime("2000-01-01"+ " " + params[:time] + ":00", '%Y-%m-%d %H:%M:%S'))
    redirect_to pathologylab_update_test_path()
  end

  def add_seats
    puts("wertgyhujkjhgfdsasdfgsdfghjkjhwqwertyui")
    plt = PathologyLabTest.find_by(test_id: params[:test_id], pathologylab_id:current_pathologylab.id)
    plt.total_seats = params[:seats]
    plt.save
    redirect_to pathologylab_update_test_path()
  end

  def add_cost
    puts("wertgyhujkjhgfdsasdfgsdfghjkjhwqwertyui")
    plt = PathologyLabTest.find_by(test_id: params[:test_id], pathologylab_id:current_pathologylab.id)
    plt.cost = params[:cost]
    plt.save
    redirect_to pathologylab_update_test_path()
  end
end
