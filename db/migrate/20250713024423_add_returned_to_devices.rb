class AddReturnedToDevices < ActiveRecord::Migration[7.1]
  # Adds a 'returned' boolean column to the devices table.
  # This column indicates whether the device has been returned by the user.
  
  def change
    add_column :devices, :returned, :boolean
  end
end
