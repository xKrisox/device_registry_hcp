require 'rails_helper'

# Basic model test for User.
# Checks that a user is valid when created with valid email and password.
RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(email: 'test@example.com', password: 'password')
    expect(user).to be_valid
  end
end