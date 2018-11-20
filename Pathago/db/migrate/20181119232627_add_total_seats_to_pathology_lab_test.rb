class AddTotalSeatsToPathologyLabTest < ActiveRecord::Migration[5.1]
  def change
    add_column :pathology_lab_tests, :total_seats, :integer
  end
end
