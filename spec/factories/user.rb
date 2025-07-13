# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com"} # Minor fix: ensure unique email for each user instance using sequence.
    password { 'password' }
    password_confirmation { 'password' }
  end
end
