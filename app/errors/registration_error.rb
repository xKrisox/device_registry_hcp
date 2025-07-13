# This error class is used to handle registration-related exceptions in the device registry system.
# The Unauthorized subclass is raised when a user attempts an unauthorized registration action.
class RegistrationError < StandardError
  class Unauthorized < RegistrationError; end
end