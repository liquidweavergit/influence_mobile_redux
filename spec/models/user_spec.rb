require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensure first name presence' do
      user = FactoryBot.build(:user, first_name: nil ).save
      expect(user).to eq(false)
    end

    it 'ensure last name presence' do
      user = FactoryBot.build(:user, last_name: nil ).save
      expect(user).to eq(false)
    end

    it 'ensure email presence' do
      user = FactoryBot.build(:user, email: nil ).save
      expect(user).to eq(false)
    end

    it 'ensure email extension validation' do
      user = FactoryBot.build(:user, email: 'email@email' ).save
      expect(user).to eq(false)
    end

    it 'ensure email prefix validation' do
      user = FactoryBot.build(:user, email: '@email.com' ).save
      expect(user).to eq(false)
    end

    it 'ensure email at validation' do
      user = FactoryBot.build(:user, email: 'emailemail.com' ).save
      expect(user).to eq(false)
    end

    it 'ensure username presence' do
      user = FactoryBot.build(:user, username: nil ).save
      expect(user).to eq(false)
    end

    it 'ensure birthdate presence' do
      user = FactoryBot.build(:user, birthdate: nil ).save
      expect(user).to eq(false)
    end

    it 'ensure gender presence' do
      user = FactoryBot.build(:user, gender: nil ).save
      expect(user).to eq(false)
    end

    it 'ensure matching passwords' do
      user = FactoryBot.build(:user, password_confirmation: 'password_confirmation' ).save
      expect(user).to eq(false)
    end

    it 'ensure save success' do
      user = FactoryBot.build(:user).save
      expect(user).to eq(true)
    end
  end

  context 'instance methods' do
    it 'ensure age reflects birthdate' do
      user = FactoryBot.create(:user, birthdate: Date.today - 40.years - 3.months)

      expect(user.age).to eq(40)
    end
  end

  context 'scope tests' do

  end
end
