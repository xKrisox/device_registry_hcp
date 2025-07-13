# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReturnDeviceFromUser do
  # TODO: Implement the tests for ReturnDeviceFromUser
  describe '#call' do
    let(:user) { create(:user) }
    let(:serial_number) { 'ABC123' }
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
