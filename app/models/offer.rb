class Offer < ApplicationRecord
  enum :gender => { any: 0,
                    female: 1,
                    male: 2 }

  validates :title, presence: true
  validates :description, presence: true
  validates :min_age, presence: true
  validates :max_age, presence: true
  validates :gender, presence: true
  validates :expiration_date, presence: true
end
