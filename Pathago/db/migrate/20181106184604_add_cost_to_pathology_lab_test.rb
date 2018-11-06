class AddCostToPathologyLabTest < ActiveRecord::Migration[5.1]
  def change
    add_column :pathology_lab_tests, :cost, :integer
  end
end
