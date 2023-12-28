# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :trackable,
         :recoverable,
         :validatable

  enum gender: { other: 0,
                 female: 1,
                 male: 2 }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :email, email: { mode: :strict }
  validates :birthdate, presence: true
  validates :gender, presence: true

  # Determine age from the user's birthdate
  def age
    now = Time.now.utc.to_date
    now.year - birthdate.year - (now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day) ? 0 : 1)
  end

  # Dynamically call the appropriate scope on Offer based upon:
  # the user's identified gender
  # and age
  def offers
    Offer.send("#{gender}_offers").for_age(age)
  end
end
