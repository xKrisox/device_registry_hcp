# The User model represents an application user and manages authentication, API keys, and associated devices.
# Each user can have multiple devices and API keys.
class User < ApplicationRecord
  has_many :api_keys, as: :bearer
  has_secure_password
  has_many :devices
end
