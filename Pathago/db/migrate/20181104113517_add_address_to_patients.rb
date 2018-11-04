class AddAddressToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :address, :text, null: false
  end
end
