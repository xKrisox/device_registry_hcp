class AddDeletedAtToDevices < ActiveRecord::Migration[7.1]
  # Adds a 'deleted_at' datetime column to the devices table.
  # This column is used for soft-deleting devices (logical deletion).
  
  def change
    add_column :devices, :deleted_at, :datetime
  end
end
