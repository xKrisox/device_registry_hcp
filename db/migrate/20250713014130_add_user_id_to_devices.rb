class AddUserIdToDevices < ActiveRecord::Migration[7.1]
  # Adds a 'user_id' reference to the devices table.
  # This column links each device to a user and enforces referential integrity.
  
  def change
    add_reference :devices, :user, null: false, foreign_key: true
  end
end
