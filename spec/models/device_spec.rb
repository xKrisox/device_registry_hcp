require 'rails_helper'
# Basic model test for Device.
# Checks that a device is valid when created with valid attributes and associated

RSpec.describe Device, type: :model do
  it 'is valid with valid attributes' do
    user = User.create!(email: 'test@example.com', password: 'password')
    device = Device.new(serial_number: '123456', user: user)
    expect(device).to be_valid
  end
end