class AddNameToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :name, :string, null: false
  end
end
