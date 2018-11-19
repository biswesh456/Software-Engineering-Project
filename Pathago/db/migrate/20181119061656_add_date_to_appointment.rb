class AddDateToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :appointment_date, :date
    add_column :appointments, :appointment_time, :time
  end
end
