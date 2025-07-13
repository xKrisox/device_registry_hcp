# The Device model represents a physical device registered in the system.
# Each device belongs to a user and must have a unique serial number.
class Device < ApplicationRecord
    belongs_to :user
    validates :serial_number, presence: true
    # Add any other validations or associations as needed
end
