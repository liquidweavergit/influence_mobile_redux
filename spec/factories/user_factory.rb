# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    username { Faker::Internet.user_name }
    birthdate { Date.today - rand(12..100).years - rand(1..12).months }
    gender { %w[male female other].sample }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
