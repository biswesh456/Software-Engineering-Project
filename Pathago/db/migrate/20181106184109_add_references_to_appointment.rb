class AddReferencesToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_reference :appointments, :pathology_lab_test, foreign_key: true
    add_reference :appointments, :patient, foreign_key: true
  end
end
