# README

Your task is to implement the part of the application that helps track devices assigned to users within an organization.

For now, we have two ActiveRecord models: User and Device.
User can have many devices; the device should be active only for one assigned user.
There are 2 actions a User can take with the Device: assign the device to User or return the Device.

Here are the product requirements:
- User can assign the device only to themself. 
- User can't assign the device already assigned to another user.
- Only the user who assigned the device can return it. 
- If the user returned the device in the past, they can't ever re-assign the same device to themself.


TODO:
 - Clone this repo to your local machine - DON'T FORK IT.
 - Fix the config, so you can run the test suite properly.
 - Implement the code to make the tests pass for `AssignDeviceToUser` service.
 - Following the product requirements listed above, implement tests for returning the device and then implement the code to make them pass.
 - In case you are missing additional product requirements, use your best judgment. Have fun with it.
 - Refactor at will. Do you see something you don't like? Change it. It's your code. Remember to satisfy the outlined product requirements though.
 - Remember to document your progress using granular commits and meaningful commit messages.
 - Publish your code as a public repo using your Github account.


                @@@PROJECT OVERVIEW@@@
This Ruby on Rails application is a device registry for organizations.
It allows users to assign devices to themselves and return them, enforcing strict business rules to ensure data integrity and proper device management.

Core Features:

User & Device Models:
- User can have many Device records.
- Each Device is assigned to one user at a time.
- Devices have a unique serial_number, a returned status, and support soft deletion (deleted_at).

Business Rules:
- Users can only assign devices to themselves.
- Devices already assigned to another user cannot be reassigned.
- Only the user who assigned the device can return it.
- Once a user returns a device, they cannot reassign it to themselves again.

API & Controllers:
- DevicesController exposes assign and unassign actions.
 -JSON responses indicate success or error reasons.

Service Objects:
- AssignDeviceToUser – encapsulates assignment logic and error handling.
 -ReturnDeviceFromUser – marks a device as returned for a user.

Testing:
- RSpec tests for models, services, and controllers.
- FactoryBot for test data.
- Tests cover all business rules and edge cases.

Project Structure:
models – ActiveRecord models (user.rb, device.rb)
controllers – RESTful controllers (devices_controller.rb)
services – Business logic encapsulated in service objects
spec – RSpec tests for models, services, controllers, and factories
migrate – Database migrations for schema changes
schema.rb – Current database structure
README.md – Project description and requirements

Dependencies and Parametrers
Ruby: 3.2+ (check .ruby-version or Gemfile)
Rails: 7.1+
Database: SQLite (default for development/test), can be switched to PostgreSQL/MySQL
Gems:
rspec-rails (testing)
factory_bot_rails (test data)
acts_as_paranoid (soft delete)
Other standard Rails dependencies

Setup & Running on Another Computer

1. Prerequisites
 - Install Ruby 3.2.3 (recommended via rbenv or rvm)
 - Install Bundler:
 gem install bundler
Install Node.js and Yarn (for Rails asset pipeline, if needed)

2. Clone the Repository
git clone https://github.com/<your-username>/device_registry.git
cd device_registry

3. Install Dependencies
bundle install

4. Set Up the Database
bin/rails db:create
bin/rails db:migrate

5. (Optional) Seed the Database
If you have seed data:
bin/rails db:seed

6. Run the Test Suite
rake db:test:prepare
bundle exec rspec

Troubleshooting
If tests fail, ensure your database is migrated and clean:
 (bin/rails db:migrate RAILS_ENV=test).
For missing gems, run bundle install.
For asset issues, run bin/rails assets:precompile.

Summary
This project is a robust, well-tested device registry system for organizations, enforcing strict assignment and return rules.
It is easy to set up on any machine with Ruby and Rails, and all logic is documented and covered by tests.
You can extend, refactor, or deploy as needed.