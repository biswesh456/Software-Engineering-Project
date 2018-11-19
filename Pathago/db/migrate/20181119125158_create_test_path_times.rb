class CreateTestPathTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :test_path_times do |t|
      t.datetime :time
      t.references :pathology_lab_tests, foreign_key: true
      t.integer :total_seats
      t.integer :occupied_seats

      t.timestamps
    end
  end
end
