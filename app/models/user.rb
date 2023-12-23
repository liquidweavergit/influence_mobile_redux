class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :email, email: {mode: :strict}
  validates :birthdate, presence: true
  validates :gender, presence: true

end
