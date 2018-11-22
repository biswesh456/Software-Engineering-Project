class CreatePathTestFixedTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :path_test_fixed_times do |t|
      t.references :pathology_lab_test, foreign_key: true
      t.time :time

      t.timestamps
    end
  end
end
