class CreatePathologyLabTests < ActiveRecord::Migration[5.1]
  def change
    create_table :pathology_lab_tests do |t|

      t.timestamps
    end
  end
end
