# frozen_string_literal: true

# Tests for the ReturnDeviceFromUser service.
# These tests verify that:
# - A device assigned to a user can be marked as returned.
# - If the device is already marked as returned, calling the service does not change its state.
# - If a user tries to return a device that does not belong to them, the device remains unchanged.
# The tests use unique serial numbers to avoid conflicts and ensure isolation.

require 'rails_helper'

RSpec.describe ReturnDeviceFromUser do
  # TODO: Implement the tests for ReturnDeviceFromUser
  describe '#call' do
    let(:user) { create(:user) }
    let(:serial_number) { SecureRandom.hex }
    let!(:device) { Device.create!(serial_number: serial_number, user_id: user.id, returned: false) }

    it 'marks the device as returned' do
      described_class.new(user: user, serial_number: serial_number, from_user: user.id).call
      expect(device.reload.returned).to eq(true)
    end

    it 'does not mark device as returned if already returned' do
      device.update!(returned: true)
      described_class.new(user: user, serial_number: serial_number, from_user: user.id).call
      expect(device.reload.returned).to eq(true)
    end

    it 'does nothing if device does not belong to user' do
      other_user = create(:user)
      described_class.new(user: other_user, serial_number: serial_number, from_user: other_user.id).call
      expect(device.reload.returned).to eq(false)
    end
  end
end
