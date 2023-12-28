# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    title { Faker::Marketing.buzzwords }
    description do
      Faker::Lorem.paragraph(sentence_count: 8,
                             supplemental: true,
                             random_sentences_to_add: 8)
    end
    min_age { rand(13..21) }
    max_age { rand(22..85) }
    gender { %w[male female any].sample }
    expiration_date { Date.today + rand(1..3).years + rand(1..12).months }
  end
end
