# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_by(username: 'admin')
unless user
  User.create(first_name: 'Admin',
              last_name: 'User',
              username: 'admin',
              birthdate: '2000-01-01',
              gender: 2,
              admin: true,
              email: 'admin@admin.com',
              password: 'password',
              password_confirmation: 'password')
end

Offer.destroy_all
100.times do |_i|
  min_age = rand(13..40)
  max_age = rand(min_age..70)
  Offer.create(
    title: Faker::Marketing.buzzwords,
    description: Faker::Lorem.paragraph(sentence_count: 8,
                                        supplemental: true,
                                        random_sentences_to_add: 8),
    min_age:,
    max_age:,
    gender: %w[male female any].sample,
    expiration_date: Date.today + rand(60..730).days
  )
end
