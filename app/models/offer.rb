class Offer < ApplicationRecord
  enum :gender => { any: 0,
                    female: 1,
                    male: 2 }

  validates :title, presence: true
  validates :description, presence: true
  validates :min_age, presence: true, numericality: { greater_than_or_equal_to: 13 }
  validates :max_age, presence: true
  validate :valid_age_range
  validates :gender, presence: true
  validates :expiration_date, presence: true
  validate :valid_expiration

  scope :not_expired, -> { where("expiration_date >= ?", Date.today)}
  scope :male_offers, -> { not_expired.where(gender: %w[any male]) }
  scope :female_offers, -> { not_expired.where(gender: %w[any female]) }
  scope :other_offers, -> { not_expired.where(gender: %w[any female male]) }
  scope :for_age, -> (age) { not_expired.where("min_age <= ? AND max_age >= ?", age, age) }

  private

  def valid_age_range
    unless max_age.to_i >= min_age.to_i
      errors.add(:max_age, "must be greater than or equal to min age")
    end
  end

  def valid_expiration
    unless expiration_date&.future?
      errors.add(:expiration_date, "must be in the future")
    end
  end
end
