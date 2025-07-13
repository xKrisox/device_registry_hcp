# The Device model represents a physical device registered in the system.
# Each device belongs to a user and must have a unique serial number.
class Device < ApplicationRecord
    acts_as_paranoid # Enables soft deletion for the Device model
    belongs_to :user
    validates :serial_number, uniqueness: { conditions: -> { where(deleted_at: nil) } }
    validates :user_id, presence: true
    # Add any other validations or associations as needed
end
