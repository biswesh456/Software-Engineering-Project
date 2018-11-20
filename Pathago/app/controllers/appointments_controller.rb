class AppointmentsController < ApplicationController
  def new
  end
  def time_info
    @test_path_time = TestPathTime.where(pathology_lab_test_id: params[:id])
    @pathology_lab_test = PathologyLabTest.find(params[:id])
    seats = @pathology_lab_test.total_seats
    @available_time = []
    day = params[:day]
    month = params[:month]
    year = params[:year]
    present = false
    @test_path_time.each do |f|
      d_day = (f.time.to_date).strftime("%d")
      d_year = (f.time.to_date).strftime("%Y")
      d_month = (f.time.to_date).strftime("%m")
      d_hours = f.time.strftime("%H")
      d_minutes = f.time.strftime("%M")
      if d_day == day && d_month == month && d_year == year
        present = true
        if f.occupied_seats < seats
          @available_time.push(d_hours + ":" + d_minutes)
        end
        break
      end
    end
    if present == false

    end
    render json: @available_time
  end
end
