class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.string :status
      t.text :result

      t.timestamps
    end
  end
end
