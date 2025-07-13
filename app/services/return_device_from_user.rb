# frozen_string_literal: true

# Service object responsible for marking a device as returned by a user.
# Finds the device assigned to the user with the given serial number and marks it as returned.
# Does nothing if the device is already returned or does not belong to the user.
#
# Dependencies:
# - Device model: must support soft deletion (acts_as_paranoid), unique serial numbers, and returned status.
# - Relies on the database structure and validations to enforce integrity.
#
# This service is intended to be called from controllers or other business logic layers
# to encapsulate all rules and side effects related to returning a device.

class ReturnDeviceFromUser
  def initialize(user:, serial_number:, from_user:)
    @user = user
    @serial_number = serial_number
    @from_user = from_user.to_i
  end

  def call
    device = Device.find_by(serial_number: @serial_number, user_id: @from_user, returned: false)
    return unless device
    device.update!(returned: true)
  end
end
