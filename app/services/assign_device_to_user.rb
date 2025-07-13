# frozen_string_literal: true

class AssignDeviceToUser
  def initialize(requesting_user:, serial_number:, new_device_owner_id:)
    @requesting_user = requesting_user
    @serial_number = serial_number
    @new_device_owner_id = new_device_owner_id
  end

  def call
    if @requesting_user.id != @new_device_owner_id
      raise RegistrationError::Unauthorized
    end

    device = Device.find_by(serial_number: @serial_number)
    if device
      if device.user_id == @new_device_owner_id
        raise AssigningError::AlreadyUsedOnUser
      else
        raise AssigningError::AlreadyUsedOnOtherUser
      end
    end

    Device.create!(serial_number: @serial_number, user_id: @new_device_owner_id)
  end
end
