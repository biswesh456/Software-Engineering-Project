class AddAttachmentToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :attachment, :string
  end
end
