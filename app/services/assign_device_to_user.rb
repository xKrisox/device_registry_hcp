# frozen_string_literal: true

class AssignDeviceToUser
  def initialize(requesting_user:, serial_number:, new_device_owner_id:)
    @requesting_user = requesting_user
    @serial_number = serial_number
    @new_device_owner_id = new_device_owner_id.to_i
  end

  def call
    if @requesting_user.id != @new_device_owner_id
      raise RegistrationError::Unauthorized
    end

    device = Device.where(serial_number: @serial_number, deleted_at: nil).order(created_at: :desc).first
    if device
      if device.user_id == @new_device_owner_id && !device.returned
        raise AssigningError::AlreadyUsedOnUser
      elsif device.user_id != @new_device_owner_id && !device.returned
        raise AssigningError::AlreadyUsedOnOtherUser
      end
    end

    returned_device = Device.where(serial_number: @serial_number, user_id: @new_device_owner_id, returned: true, deleted_at: nil).exists?
    if returned_device
      raise AssigningError::AlreadyUsedOnUser
    end

    Device.create!(serial_number: @serial_number, user_id: @new_device_owner_id, returned: false)
  end
end
